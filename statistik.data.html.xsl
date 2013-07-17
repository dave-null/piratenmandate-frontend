<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:key name="exparteien" match="mandat[@type='transfer' and not(@multi)]" use="@from" />
<xsl:key name="fraktionspartner" match="partner" use="@partei" />

<xsl:template match="/">

  <script type="text/javascript">
  <xsl:text>var graphColors = {}; var graphData = {};</xsl:text>
  <xsl:text>jqPlotDefaults.renderer = jQuery.jqplot.PieRenderer;</xsl:text>
  </script>

  <h2>Übertritte</h2>
  <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="transfers" class="jqplotContainer"></div>
    </div>
    <div class="span7">
      And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.
    </div>
  </div>
  <script type="text/javascript">
  <xsl:text>
    var thisName = 'transfers';
    graphData[thisName] = [];
    graphColors[thisName] = [];
  </xsl:text>
  <xsl:for-each select="//mandat[@type='transfer'][generate-id() = generate-id(key('exparteien', @from)[1])]">
    <xsl:sort select="count(key('exparteien', @from))" data-type="number"  order="descending" />
      <xsl:text>graphData[thisName].push([</xsl:text>
      <xsl:text>'</xsl:text><xsl:value-of select="@from" /><xsl:text>',</xsl:text>
      <xsl:value-of select="count(key('exparteien', @from))" />
      <xsl:text>]);&#10;</xsl:text>
      <xsl:text>graphColors[thisName].push(Pc['</xsl:text><xsl:value-of select="@from" /><xsl:text>']);&#10;</xsl:text>
  </xsl:for-each>
  <xsl:text>
    var plot = jQuery.jqplot (thisName, [graphData[thisName]],{
      seriesColors: graphColors[thisName],
      seriesDefaults: jqPlotDefaults,
      legend: jqPlotLegendDefaults
    });
  </xsl:text>
  </script>

  <h2>Fraktionspartner</h2>
  <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="frkpartner" class="jqplotContainer"></div>
    </div>
    <div class="span7">
      And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.
    </div>
  </div>
  <script type="text/javascript">
  <xsl:text>
    var thisName = 'frkpartner';
    graphData[thisName] = [];
    graphColors[thisName] = [];
  </xsl:text>
  <xsl:for-each select="//partner[generate-id() = generate-id(key('fraktionspartner', @partei)[1])]">
    <xsl:sort select="count(key('fraktionspartner', @partei))" data-type="number"  order="descending" />
      <xsl:text>graphData[thisName].push([</xsl:text>
        <xsl:text>'</xsl:text><xsl:value-of select="@partei" /><xsl:text>',</xsl:text>
        <xsl:value-of select="count(key('fraktionspartner', @partei))" />
      <xsl:text>]);&#10;</xsl:text>
      <xsl:text>graphColors[thisName].push(Pc['</xsl:text><xsl:value-of select="@partei" /><xsl:text>']);&#10;</xsl:text>
  </xsl:for-each>
  <xsl:text>
    var plot = jQuery.jqplot (thisName, [graphData[thisName]],{
      seriesColors: graphColors[thisName],
      seriesDefaults: jqPlotDefaults,
      legend: jqPlotLegendDefaults
    });
  </xsl:text>
  </script>

</xsl:template>
</xsl:transform>
