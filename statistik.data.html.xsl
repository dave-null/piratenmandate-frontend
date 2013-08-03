<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:key name="exparteien" match="mandat[@type='transfer' and not(@multi)]" use="@from" />
<xsl:key name="fraktionspartner" match="partner" use="@partei" />
<xsl:key name="vertretungen" match="parlament" use="@name" />
<xsl:key name="gebiete" match="gebiet[./parlament]" use="@type" />

<xsl:template match="/">

  <script type="text/javascript">
  <xsl:text>var graphColors = {}; var graphData = {};</xsl:text>
  <xsl:text>jqPlotDefaults.renderer = jQuery.jqplot.PieRenderer;</xsl:text>
  </script>


  <p>Your bones don't break, mine do. That's clear. Your cells react to bacteria and viruses differently than mine. You don't get sick, I do. That's also clear. But for some reason, you and I react the exact same way to water. We swallow it too fast, we choke. We get some in our lungs, we drown. However unreal it may seem, we are connected, you and I. We're on the same curve, just on opposite ends.</p>
  <h4><xsl:text>Vertretungen mit PIRATEN-Mandatsträgern gibt es in: </xsl:text></h4>
  <ul class="prose">
    <xsl:for-each select="//gebiet[generate-id() = generate-id(key('gebiete', @type)[1])]">
    <xsl:sort select="count(key('gebiete', @type))" data-type="number" order="descending" />
      <li>
        <xsl:value-of select="count(key('gebiete', @type))" /><xsl:text>×&#160;</xsl:text>
        <xsl:value-of select="@type" />
      </li>
    </xsl:for-each>
  </ul>
  <div class="divider" />
  <h4><xsl:text>Die Vertretunge mit PIRATEN-Mandatsträgern sind: </xsl:text></h4>
  <ul class="prose">
    <xsl:for-each select="//parlament[generate-id() = generate-id(key('vertretungen', @name)[1])]">
    <xsl:sort select="count(key('vertretungen', @name))" data-type="number" order="descending" />
      <li>
        <xsl:value-of select="count(key('vertretungen', @name))" /><xsl:text>×&#160;</xsl:text>
        <xsl:value-of select="@name" />
      </li>
    </xsl:for-each>
  </ul>
  <div class="divider" />


  <h1>Fraktionen</h1>

  <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="frkmitgl" class="jqplotContainer"></div>
    </div>
    <div class="span7">
      <h2>Fraktionsmitglieder</h2>
      And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.
    </div>
  </div>
  <script type="text/javascript">
  <xsl:text>
    var thisName = 'frkmitgl';
    graphData[thisName] = [];
    graphColors[thisName] = [];
  </xsl:text>
  <xsl:text>graphData[thisName].push(['Fraktionsmitglieder',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type!='none' and @type!='unknown']]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#f80');</xsl:text>
  <xsl:text>graphData[thisName].push(['Fraktionslose',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type='none']]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#b40');</xsl:text>
  <xsl:text>graphData[thisName].push(['keine Fraktionen',</xsl:text>
  <xsl:value-of select="count(//parlament[not(fraktion)]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#fc5');</xsl:text>
  <xsl:text>graphData[thisName].push(['unbekannt',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type='unknown']]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#666');</xsl:text>
  <xsl:text>
    var plot = jQuery.jqplot (thisName, [graphData[thisName]],{
      seriesColors: graphColors[thisName],
      seriesDefaults: jqPlotDefaults,
      legend: jqPlotLegendDefaults
    });
  </xsl:text>
  </script>

  <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="frktypnum" class="jqplotContainer"></div>
    </div>
    <div class="span7">
      <h2>Fraktionsarten</h2>
      And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.
    </div>
  </div>
  <script type="text/javascript">
  <xsl:text>
    var thisName = 'frktypnum';
    graphData[thisName] = [];
    graphColors[thisName] = [];
  </xsl:text>
  <xsl:text>graphData[thisName].push(['PIRATEN-Fraktion',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type='piraten']])" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#f80');</xsl:text>
  <xsl:text>graphData[thisName].push(['Gemeinsame',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type='gemeinsam']])" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#f40');</xsl:text>
  <xsl:text>graphData[thisName].push(['Fremde',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type='fremd']])" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#08f');</xsl:text>
  <xsl:text>
    var plot = jQuery.jqplot (thisName, [graphData[thisName]],{
      seriesColors: graphColors[thisName],
      seriesDefaults: jqPlotDefaults,
      legend: jqPlotLegendDefaults
    });
  </xsl:text>
  </script>

  <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="frktyp" class="jqplotContainer"></div>
    </div>
    <div class="span7">
      <h2>Fraktionsarten (Zahl der Mitglieder)</h2>
      And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.
    </div>
  </div>
  <script type="text/javascript">
  <xsl:text>
    var thisName = 'frktyp';
    graphData[thisName] = [];
    graphColors[thisName] = [];
  </xsl:text>
  <xsl:text>graphData[thisName].push(['PIRATEN-Fraktion',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type='piraten']]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#f80');</xsl:text>
  <xsl:text>graphData[thisName].push(['Gemeinsame',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type='gemeinsam']]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#f40');</xsl:text>
  <xsl:text>graphData[thisName].push(['Fremde',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type='fremd']]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#08f');</xsl:text>
  <xsl:text>
    var plot = jQuery.jqplot (thisName, [graphData[thisName]],{
      seriesColors: graphColors[thisName],
      seriesDefaults: jqPlotDefaults,
      legend: jqPlotLegendDefaults
    });
  </xsl:text>
  </script>

  <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="frkpartner" class="jqplotContainer"></div>
    </div>
    <div class="span7">
      <h2>Fraktionspartner</h2>
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
    <xsl:sort select="count(key('fraktionspartner', @partei))" data-type="number" order="descending" />
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

    <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="frkpartnernum" class="jqplotContainer"></div>
    </div>
    <div class="span7">
      <h2>Fraktionspartner (Zahl der Abgeordneten)</h2>
      And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.
    </div>
  </div>
  <script type="text/javascript">
  <xsl:text>
    var thisName = 'frkpartnernum';
    graphData[thisName] = [];
    graphColors[thisName] = [];
  </xsl:text>
  <xsl:for-each select="//partner[generate-id() = generate-id(key('fraktionspartner', @partei)[1])]">
    <xsl:sort select="sum(key('fraktionspartner', @partei)/@num)" data-type="number" order="descending" />
      <xsl:text>graphData[thisName].push([</xsl:text>
        <xsl:text>'</xsl:text><xsl:value-of select="@partei" /><xsl:text>',</xsl:text>
        <xsl:value-of select="sum(key('fraktionspartner', @partei)/@num)" />
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

  <h1>Übertritte</h1>

  <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="transferovw" class="jqplotContainer"></div>
    </div>
    <div class="span7">
    <h2>Gewählte und Übergetretene</h2>
      And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.
    </div>
  </div>
  <script type="text/javascript">
  <xsl:text>
    var thisName = 'transferovw';
    graphData[thisName] = [];
    graphColors[thisName] = [];
  </xsl:text>
    <xsl:text>graphData[thisName].push(['Gewählte Piraten',</xsl:text>
    <xsl:value-of select="count(//mandat[@type='pirat' and not(@multi)])" /><xsl:text>]);</xsl:text>
    <xsl:text>graphColors[thisName].push('#f80');</xsl:text>
    <xsl:text>graphData[thisName].push(['Übergetretene',</xsl:text>
    <xsl:value-of select="count(//mandat[@type='transfer' and not(@multi)])" /><xsl:text>]);</xsl:text>
    <xsl:text>graphColors[thisName].push('#f40');</xsl:text>
  <xsl:text>
    var plot = jQuery.jqplot (thisName, [graphData[thisName]],{
      seriesColors: graphColors[thisName],
      seriesDefaults: jqPlotDefaults,
      legend: jqPlotLegendDefaults
    });
  </xsl:text>
  </script>

  <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="transfers" class="jqplotContainer"></div>
    </div>
    <div class="span7">
    <h2>Ursprüngliche Parteien</h2>
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
    <xsl:sort select="count(key('exparteien', @from))" data-type="number" order="descending" />
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

</xsl:template>
</xsl:transform>
