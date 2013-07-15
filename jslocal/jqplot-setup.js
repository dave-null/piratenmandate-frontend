jqPlotDefaults = {
  renderer: jQuery.jqplot.PieRenderer,
  rendererOptions: {
    showDataLabels: true,
    dataLabels: 'value',
    startAngle: 180,
    sliceMargin: 5,
    dataLabelPositionFactor: 0.65
}}
jqPlotLegendDefaults = { show:true, location: 'e' }

var plot1 = jQuery.jqplot ('uebertritte', [data],
  {
    seriesColors: pc,
    seriesDefaults: jqPlotDefaults,
    legend: jqPlotLegendDefaults
  }
);
var plot2 = jQuery.jqplot ('fraktionspartner', [data2],
  {
    seriesColors: pc2,
    seriesDefaults: jqPlotDefaults,
    legend: jqPlotLegendDefaults
  }
);