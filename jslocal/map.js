// Leaflet-Karte einrichten – Werte aus mapSettings definiert in styles.js
//
map = new L.Map('leafletContainer',{zoomControl:false});
map.addControl(L.control.zoom({position:mapSettings.zoomPosition}));
map.attributionControl.setPrefix(mapSettings.credits);
tileLayer = map.addLayer(new L.TileLayer(mapSettings.tiles, mapSettings.zoomLimits));

function upButton() {
  if (!(cL == Bund.layers[0] || cL == Bund.layers[1])) { engageLayer(Bund,0); }
}
function expandButton() {map.fitBounds(cL.getBounds());}

L.Control.Command = L.Control.extend({
    options: {position: mapSettings.extraButtonPosition,}
  ,onAdd: function() {
    var controlDiv = L.DomUtil.create('div', 'leaflet-control-up');
    L.DomEvent
      .addListener(controlDiv, 'click', L.DomEvent.stopPropagation)
      .addListener(controlDiv, 'click', L.DomEvent.preventDefault)
      .addListener(controlDiv, 'click', function () { upButton(); });
    var controlUI = L.DomUtil.create('a', 'leaflet-control-up-interior', controlDiv);
    controlUI.id = "up-button";
    controlUI.href = "#";
    controlUI.title = 'Übergeordnetes Gebiet zeigen';
    return controlDiv;
}}); map.addControl(new L.Control.Command({}));
L.Control.Command = L.Control.extend({
    options: {position: mapSettings.extraButtonPosition,}
  ,onAdd: function() {
    var controlDiv = L.DomUtil.create('div', 'leaflet-control-expand');
    L.DomEvent
      .addListener(controlDiv, 'click', L.DomEvent.stopPropagation)
      .addListener(controlDiv, 'click', L.DomEvent.preventDefault)
      .addListener(controlDiv, 'click', function () { expandButton(); });
    var controlUI = L.DomUtil.create('a', 'leaflet-control-expand-interior', controlDiv);
    controlUI.id = "expand-button";
    controlUI.href = "#";
    controlUI.title = 'Ganzes Gebiet zeigen';
    return controlDiv;
}}); map.addControl(new L.Control.Command({}));

// 
//
var Bund = {'data':{}, 'layers':{}};
var Laender = {'data':{}, 'layers':{}};
var cL = null;

laenderNames = {'01':'Schleswig-Holstein','02':'Hamburg','03':'Niedersachsen','04':'Bremen','05':'Nordrhein-Westfalen','06':'Hessen','07':'Rheinland-Pfalz','08':'Baden-Württemberg','09':'Bayern','10':'Saarland','11':'Berlin','12':'Brandenburg','13':'Mecklenburg-Vorpommern','14':'Sachsen','15':'Sachsen-Anhalt','16':'Thüringen'};
$.getJSON('geojson/kreise.json',function(data){
  Bund.data[0] = data;
  Bund.data[0].depth = 0;
  Bund.data[0].name = null;
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
  if (set == Bund) {$('#up-button').addClass('up-inactive');} else {$('#up-button').removeClass('up-inactive')}
  if (!(id in set.layers)) {
    set.layers[id] = L.geoJson(set.data[id],{style:gebietStyle,onEachFeature:labelClick}).addTo(map);
    set.layers[id].depth = set.data[id].depth;
    set.layers[id].name = set.data[id].name;
  } else {
    set.layers[id].addTo(map); }
  cL = set.layers[id];
  printNav(set,id);
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

function labelClick(feature,layer) {
  layer.bindLabel(feature.properties.name).on('click',function(e){
    if (cL.depth < 2) {
      engageLayer(Laender,feature.properties.key.substring(0,2));
    } else {
      map.fitBounds(e.target.getBounds());
    }
})}

function gebietStyle(feature) {
  if (feature.properties.key in gc) { return $.extend(mapSettings.gebietDefaults, Gc[gc[feature.properties.key]]); }
  else { return $.extend(mapSettings.gebietDefaults, Gc['D']); } }