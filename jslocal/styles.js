// Karten
//
var mapSettings = {
  credits: '<a href="http://www.openstreetmap.org">OpenStreetMap</a> und <a href="http://www.bkg.bund.de/">GeoBasis-DE/BKG</a>, 2013 (Daten verändert)<br>Kartengrafiken: <a href="http://maps.stamen.com">Stamen</a> (Theme: Watercolor) | Framework: <a href="http://www.leafletjs.com">Leaflet</a>'
  ,tiles: 'http://c.tile.stamen.com/watercolor/{z}/{x}/{y}.jpg'
  ,zoomLimits: {minZoom:5, maxZoom:12}
  ,zoomPosition: 'topleft'
  ,extraButtonPosition: 'topright'
  ,gebietDefaults: {color:'#000', weight:1.3, opacity:0.5}
}

var Gc = { // Styles for gebiete
   "D":{fillColor:'#444', fillOpacity:0.15} // Default
  ,"P":{fillColor:'#f80', fillOpacity:0.6}  // Piraten
  ,"Ü":{fillColor:'#fb5', fillOpacity:0.5}  // Übertritte
};
var highlightStyle = {weight:5, opacity:1}
var middleStyle = { fillOpacity:0, weight:2.6, opacity:1 }

// Statistik
// 
jqPlotDefaults = {
  renderer: null,
  rendererOptions: {
    showDataLabels: true,
    dataLabels: 'value',
    startAngle: 180,
    sliceMargin: 5,
    dataLabelPositionFactor: 0.65
}}
jqPlotLegendDefaults = { show:true, location: 'e' }

var Pc = {
   'LINKE':'#a00'
  ,'CDU/CSU':'#000'
  ,'FW/UWG/etc.':'#09f'
  ,'GRÜNE':'#0c0'
  ,'Einzelbewerber':'#aaa'
  ,'SPD':'#e20019'
  ,'FDP':'#ee0'
  ,'Bündnis 21/RRP':'#d62'
  ,'Die PARTEI':'#b5152b'
  ,'Offene/Bunte/Lokale Liste':'#ae1af7'
  ,'ÖDP':'#ed7505'
};