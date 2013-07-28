// Karten
//
var mapSettings = {
  credits: '<a href="http://www.openstreetmap.org">OpenStreetMap</a> und <a href="http://www.bkg.bund.de/">GeoBasis-DE/BKG</a>, 2013 (Daten verändert)<br>Kartengrafiken: <a href="http://maps.stamen.com">Stamen</a> (Theme: Watercolor) | Framework: <a href="http://www.leafletjs.com">Leaflet</a>'
  ,tiles: 'http://c.tile.stamen.com/watercolor/{z}/{x}/{y}.jpg'
  ,zoomLimits: {minZoom:5, maxZoom:12}
  ,zoomPosition: 'topright'
  ,extraButtonPosition: 'topleft'
  ,gebietDefaults: {color:'#000', weight:1.3, opacity:0.5}
}

var Gc = { // Styles for gebiete
   "D":{fillColor:'#444', fillOpacity:0.15} // Default
  ,"P":{fillColor:'#f80', fillOpacity:0.6}  // Piraten
  ,"Ü":{fillColor:'#fb5', fillOpacity:0.5}  // Übertritte
};
var highlightStyle = {weight:5, opacity:1}

var specialBounds = { // Gebiete mit fernen Inseln sollten auf das Hauptgebiet zoomen
   "Hamburg":   [[53.32185071096412,9.547119140624998], [53.81119329209967,10.5084228515625]]
  ,"Pinneberg": [[53.48069104263886,9.25323486328125], [53.9682045419455,10.21453857421875]]
  ,"Bremen":    [[], []]
}

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
  ,'Wählergemeinschaft':'#09f'
  ,'GRÜNE':'#0c0'
  ,'Einzelbewerber':'#aaa'
  ,'SPD':'#e20019'
  ,'FDP':'#ee0'
  ,'Bündnis 21/RRP':'#d62'
  ,'Die PARTEI':'#b5152b'
  ,'Europaliste Frankfurt':'#036'
};