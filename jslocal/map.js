// Leaflet-Karte einrichten – Werte aus mapSettings definiert in styles.js
//
map = new L.Map('leafletContainer',{zoomControl:false});
map.addControl(L.control.zoom({position:mapSettings.zoomPosition}));
map.attributionControl.setPrefix(mapSettings.credits);
tileLayer = map.addLayer(new L.TileLayer(mapSettings.tiles, mapSettings.zoomLimits));

function expandButtonFct() {
	map.fitBounds(cL.getBounds());
	$('.open h2').trigger('click');
}
expandButtonOpt = {'text':"","onClick":expandButtonFct};
var expandButtonCtl = new L.Control.Button(expandButtonOpt).addTo(map);

var Bund = {'data':{}, 'layers':{}};
var Laender = {'data':{}, 'layers':{}};
var Features = {};
var cL = null;

laenderNames = {'01':'Schleswig-Holstein','02':'Hamburg','03':'Niedersachsen','04':'Bremen','05':'Nordrhein-Westfalen','06':'Hessen','07':'Rheinland-Pfalz','08':'Baden-Württemberg','09':'Bayern','10':'Saarland','11':'Berlin','12':'Brandenburg','13':'Mecklenburg-Vorpommern','14':'Sachsen','15':'Sachsen-Anhalt','16':'Thüringen'};
$.getJSON('geojson/kreise.json',function(data){
  Bund.data[0] = data;
  Bund.data[0].depth = 0;
  Bund.data[0].name = "Deutschland";
  engageLayer(Bund,0);
  $.each(data.features, function(I,feature){
    id = feature.properties.key.substring(0,2);
    if ($.inArray(id,['02','04','11']) == -1) { // Ausnahmen: HH, BE, HB
      if (!(id in Laender.data)) { Laender.data[id] = {'type':'FeatureCollection','features':[],'depth':2,'name':laenderNames[id]}; }
      Laender.data[id].features.push(feature);
}})});
$.getJSON('geojson/laender.json',function(data){ Bund.data[1] = data; Bund.data[1].depth = 0; Bund.data[1].name = null; });
$.each(['02','04','11'],function(I,id){
  $.getJSON('geojson/'+laenderNames[id]+'.json',function(data){ Laender.data[id] = data; Laender.data[id].depth = 2; Laender.data[id].name = laenderNames[id]; });
});

function engageLayer(set, id) {
  if (cL) {map.removeLayer(cL);}
  if (!(id in set.layers)) {
    set.layers[id] = L.geoJson(set.data[id],{style:gebietStyle,onEachFeature:featureSetup}).addTo(map);
    set.layers[id].depth = set.data[id].depth;
    set.layers[id].name = set.data[id].name;
  } else {
    set.layers[id].addTo(map); }
  cL = set.layers[id];
  printNav(set,id);
	expandButtonOpt.text ="Ganz "+cL.name+" anzeigen";
	expandButtonCtl.setButton(expandButtonOpt);
  map.fitBounds(cL.getBounds());
}

function printNav(set,id) {
  depth = set.data[id].depth;
  name = set.data[id].name;
  var outS = '';
  var outL = {'Land':''};
  var nBund = {'mitLink':'<a href="javascript:engageLayer(Bund,0)">Bundesrepublik</a>', 'ohneLink':'Bundesrepublik'};
  var nKreise = {'mitLink':'<a href="javascript:engageLayer(Bund,0)">Kreise</a>', 'ohneLink':'Kreise'};
  var nLaender = {'mitLink':'<a href="javascript:engageLayer(Bund,1)">Länder</a>', 'ohneLink':'Länder'};
  if (depth == 0) {
    outL.Bund = nBund.ohneLink
    if (id == 0) { outL.Kreise = nKreise.ohneLink; outL.Laender = nLaender.mitLink }
    else if (id == 1) { outL.Kreise = nKreise.mitLink; outL.Laender = nLaender.ohneLink }
  }
  else if (depth > 0) {
    outL.Bund = nBund.mitLink; outL.Kreise = nKreise.mitLink; outL.Laender = nLaender.mitLink;
    outL.Land = ' | '+name;
  }
  outS = outL.Bund+' ('+outL.Kreise+', '+outL.Laender+')'+outL.Land
  $('#mapnav').html(outS);
}

function featureSetup(feature,layer) {
	Features[feature.properties.key] = feature;
  layer.bindLabel(feature.properties.name).on('click',function(e){
    if (cL.depth == 0) {
      engageLayer(Laender,feature.properties.key.substring(0,2));
    }
    if (!($('#'+feature.properties.key).hasClass('open'))) {
			$('#'+feature.properties.key+' h2').trigger('click');}
})}

function gebietStyle(feature) {
  if (feature.properties.key in gc) { return $.extend(mapSettings.gebietDefaults, Gc[gc[feature.properties.key]]); }
  else { return $.extend(mapSettings.gebietDefaults, Gc['D']); } }