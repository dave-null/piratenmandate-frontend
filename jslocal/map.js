// Leaflet-Karte einrichten – Werte aus mapSettings definiert in styles.js
//
map = new L.Map('leafletContainer',{zoomControl:false});
map.addControl(L.control.zoom({position:mapSettings.zoomPosition}));
map.attributionControl.setPrefix(mapSettings.credits);
tileLayer = map.addLayer(new L.TileLayer(mapSettings.tiles, mapSettings.zoomLimits));

function expandButtonFct() {
	if (cL.depth == 0) {
		map.fitBounds(cL.getBounds());
		$('.open h2').trigger('click');
	} else {
		engageLayer(Bund,0);
	}
}
expandButtonOpt = {'text':"Ganz Deutschland anzeigen","onClick":expandButtonFct};
var expandButtonCtl = new L.Control.Button(expandButtonOpt).addTo(map);

var Bund = {'data':{}, 'layers':{}};
var Laender = {'data':{}, 'layers':{}};
var Features = {};
var cL = null;
var cLm = null;
var highlight = null;

var laenderNames = {'01':'Schleswig-Holstein','02':'Hamburg','03':'Niedersachsen','04':'Bremen','05':'Nordrhein-Westfalen','06':'Hessen','07':'Rheinland-Pfalz','08':'Baden-Württemberg','09':'Bayern','10':'Saarland','11':'Berlin','12':'Brandenburg','13':'Mecklenburg-Vorpommern','14':'Sachsen','15':'Sachsen-Anhalt','16':'Thüringen'};
var laenderAusnahmen = ['02','04','11']; // Ausnahmen: HH, BE, HB
var hasMiddle = ['09'];
$.getJSON('geojson/kreise.json',function(data){
  Bund.data[0] = data;
  Bund.data[0].depth = 0;
  Bund.data[0].name = "Deutschland";
  engageLayer(Bund,0);
  $.each(data.features, function(I,feature){
    id = feature.properties.key.substring(0,2);
    if ($.inArray(id,laenderAusnahmen) == -1) {
      if (!(id in Laender.data)) { Laender.data[id] = {'type':'FeatureCollection','features':[],'depth':2,'name':laenderNames[id]}; }
      Laender.data[id].features.push(feature);
}})});
$.getJSON('geojson/laender.json',function(data){ Bund.data[1] = data; Bund.data[1].depth = 0; Bund.data[1].name = "Deutschland"; });
$.each(laenderAusnahmen,function(I,id){
  $.getJSON('geojson/'+id+'.json',function(data){ Laender.data[id] = data; Laender.data[id].depth = 2; Laender.data[id].name = laenderNames[id]; });
});
$.each(hasMiddle,function(I,id){
  $.getJSON('geojson/'+id+'m'+'.json',function(data){ Laender.data[id+'m'] = data; });
});

function engageLayer(set, id) {
  if (cL) {map.removeLayer(cL);}
  if (cLm) {map.removeLayer(cLm);}
  if (!(id in set.layers)) {
		if ($.inArray(id,hasMiddle) != -1) {
			set.layers[id+'m'] = L.geoJson(set.data[id+'m'],
				{onEachFeature:function(feature){Features[feature.properties.key] = feature;}
				,style:function(f){return $.extend({},mapSettings.gebietDefaults,middleStyle);}}
			).addTo(map);
			cLm = set.layers[id+'m'];
		}
    set.layers[id] = L.geoJson(set.data[id],{style:gebietStyle,onEachFeature:featureSetup}).addTo(map);
    set.layers[id].depth = set.data[id].depth;
    set.layers[id].name = set.data[id].name;
  } else {
		set.layers[id].setStyle(gebietStyle);
		if ($.inArray(id,hasMiddle) != -1) { set.layers[id+'m'].addTo(map); }
    set.layers[id].addTo(map); }
  cL = set.layers[id];
	if (cL.depth == 2) {
		$('#contentbox').load('data/'+id+'.html',accordeonInit)
	} else if (set == Bund) {
		$('#contentbox').load('data/0.html')
	}
  printNav(set,id);
// 	expandButtonOpt.text ="Ganz "+cL.name+" anzeigen";
// 	expandButtonCtl.setButton(expandButtonOpt);
  map.fitBounds(cL.getBounds());
}

function printNav(set,id) {
  depth = set.data[id].depth;
  name = set.data[id].name;
	var outPrefix = "<ul><li>Kartendarstellung:</li></ul>";
  var outS = '';
  var outL = {'Land':''};
  var nKreise = {'mitLink':'<a href="javascript:engageLayer(Bund,0)">Alle Kreise</a>', 'ohneLink':'Alle Kreise'};
  var nLaender = {'mitLink':'<a href="javascript:engageLayer(Bund,1)">Alle Länder</a>', 'ohneLink':'Alle Länder'};
  if (depth == 0) {
    if (id == 0) { outL.Kreise = nKreise.ohneLink; outL.Laender = nLaender.mitLink }
    else if (id == 1) { outL.Kreise = nKreise.mitLink; outL.Laender = nLaender.ohneLink }
  }
  else if (depth > 0) {
    outL.Kreise = nKreise.mitLink; outL.Laender = nLaender.mitLink;
    outL.Land = '<ul><li>'+name+'</li></ul>';
  }
  outS = outPrefix+'<ul><li>'+outL.Laender+'</li><li>'+outL.Kreise+'</li></ul>'+outL.Land
  $('#mapMenu').html(outS);
}

function featureSetup(feature,layer) {
	if (feature.properties.key in gc) { Features[feature.properties.key] = feature; }
	layer.bindLabel(feature.properties.name).on('click',function(e){
		if (cL.depth == 0) {
			engageLayer(Laender,feature.properties.key.substring(0,2));
			if (feature.properties.key in gc) { $('#'+feature.properties.key+' h2').trigger('click'); }
		} else {
			$('#'+feature.properties.key+' h2').trigger('click');
		}
})}

function gebietStyle(feature) {
	var S = {}; $.extend(S,mapSettings.gebietDefaults);
	if (feature.properties.key in gc) {
		$.extend(S,Gc[gc[feature.properties.key]]);
	} else {
		$.extend(S,Gc['D']);
	}
	if (feature.properties.key == highlight) {
		$.extend(S, highlightStyle)
		highlight = null;
	}
	return S;
}