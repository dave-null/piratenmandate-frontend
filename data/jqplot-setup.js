jqPlotDefaults = {
  renderer: jQuery.jqplot.PieRenderer,
  rendererOptions: {
    showDataLabels: true,
    dataLabels: 'value',
    startAngle: 180,
    sliceMargin: 5,
    dataLabelPositionFactor: 0.65
}}

var plot1 = jQuery.jqplot ('uebertritte', [data],
  {
    seriesColors: pc,
    seriesDefaults: jqPlotDefaults,
    legend: { show:true, location: 'w' }
  }
);
var plot2 = jQuery.jqplot ('fraktionspartner', [data2],
  {
    seriesColors: pc2,
    seriesDefaults: jqPlotDefaults,
    legend: { show:true, location: 'w' }
  }
);