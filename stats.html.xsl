<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:key name="exparteien" match="mandat[@from and not(@multi)]" use="@from" />
<xsl:key name="fraktionspartner" match="partner" use="@partei" />
<xsl:key name="vertretungen" match="parlament" use="@name" />
<xsl:key name="gebiete" match="gebiet[./parlament]" use="@type" />

<xsl:template match="/">

  <script type="text/javascript">
  <xsl:text>var graphColors = {}; var graphData = {};</xsl:text>
  <xsl:text>jqPlotDefaults.renderer = jQuery.jqplot.PieRenderer;</xsl:text>
  </script>

  <h1>Mandatsträger</h1>

  <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="transferovw" class="jqplotContainer">&#160;</div>
    </div>
    <div class="span7">
    <h2>Mandatsträger nach Art der Wahl</h2>
      <p>Derzeit haben <strong><xsl:value-of select="count(//mandat[not(@multi)])" />&#160;Mitglieder&#160;der&#160;Piratenpartei</strong> Mandate in kommunalen Vertretungen inne. (Da manche mehrere Mandate in verschiedenen Vertretungen gleichzeitig ausüben, halten sie insgesamt <xsl:value-of select="count(//mandat)" />&#160;kommunale&#160;Mandate.)</p>
      <p>Auf Wahllisten der PIRATEN wurden <strong><xsl:value-of select="count(//mandat[@type='pirat' and not(@multi)])" />&#160;Mandatsträger</strong> gewählt.</p>
      <p>Weitere <strong><xsl:value-of select="count(//mandat[@type='fremdliste' and not(@multi)])" />&#160;Mandatsträger</strong> sind als Mitglieder der Piratenpartei auf anderen Listen gewählt worden. Zudem sind <strong><xsl:value-of select="count(//mandat[@type='transfer' and not(@multi)])" />&#160;Mandatsträger</strong> durch nachträgliche Parteiübertritte hinzugekommen.</p>
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
    <xsl:text>graphData[thisName].push(['Fremdlisten',</xsl:text>
    <xsl:value-of select="count(//mandat[@type='fremdliste' and not(@multi)])" /><xsl:text>]);</xsl:text>
    <xsl:text>graphColors[thisName].push('#08f');</xsl:text>
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
      <div id="transfers" class="jqplotContainer">&#160;</div>
    </div>
    <div class="span7">
    <h2>Übertritte und Fremdlisten nach Parteien</h2>
      <p>Die <xsl:value-of select="count(//mandat[@from and not(@multi)])" />&#160;übergetretenen oder auf Fremdlisten gewählten Mandatsträger teilen sich wie hier gezeigt auf die Listen auf, auf denen sie gewählt wurden.</p>
      <p>Unter „Offene/Bunte/Lokal“ sind zumeist alternative, junge und offene Listen zusammengefasst. Zu „FW/UWG/etc.“ zählen hingegen eher Gruppen, die sich Freie Wähler (FW) oder Unabhängige Wählergemeinschaft (UWG) nennen, oder ähnlich wie diese auftreten (z.B. auch „Bürger für Entenhausen“ oder „Wir für Gotham City“).</p>
<!--       <p>„Einzelbewerber“ sind Personen, die ohne Wahlliste angetreten sind, also direkt, persönlich und für keine Vereinigung gewählt wurden.</p> -->
    </div>
  </div>
  <script type="text/javascript">
  <xsl:text>
    var thisName = 'transfers';
    graphData[thisName] = [];
    graphColors[thisName] = [];
  </xsl:text>
  <xsl:for-each select="//mandat[@from][generate-id() = generate-id(key('exparteien', @from)[1])]">
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

  <h1>Vertretungen</h1>
  <p>Grundsätzlich ist die kommunale Verwaltungsstruktur in (Land)kreise, Städte und Gemeinden aufgeteilt. Es gibt jedoch zahlreihe regionale Unterschiede und Besonderheiten. Entsprechend vielfältig sind die Gebiete, in denen es Vertretungen mit Piraten-Vertretern gibt:</p>
  <ul class="cols">
    <xsl:for-each select="//gebiet[generate-id() = generate-id(key('gebiete', @type)[1])]">
    <xsl:sort select="count(key('gebiete', @type))" data-type="number" order="descending" />
      <li>
        <xsl:value-of select="count(key('gebiete', @type))" /><xsl:text>×&#160;</xsl:text>
        <xsl:value-of select="@type" />
      </li>
    </xsl:for-each>
  </ul>
  <p>Aus den gleichen Gründen haben auch die Vertretungen selbst viele verschiedene Namen:</p>
  <ul class="cols">
    <xsl:for-each select="//parlament[generate-id() = generate-id(key('vertretungen', @name)[1])]">
    <xsl:sort select="count(key('vertretungen', @name))" data-type="number" order="descending" />
      <li>
        <xsl:value-of select="count(key('vertretungen', @name))" /><xsl:text>×&#160;</xsl:text>
        <xsl:value-of select="@name" />
      </li>
    </xsl:for-each>
  </ul>
  

  <h1>Fraktionen</h1>

  <div class="row-fluid statistikRow">
    <div class="span5 statistik">
      <div id="frkmitgl" class="jqplotContainer">&#160;</div>
    </div>
    <div class="span7">
      <h2>Fraktionsmitgliedschaft</h2>
      <p>Fraktionen sind Zusammenschlüsse von Vertretern in einer Versammlung, die für ihre politische Arbeit besondere Mittel zur Verfügung haben. Dazu zählt z.B. die Benennung von Bürgern als Ausschussmitglieder sowie Fraktionsmittel für Öffentlichkeitsarbeit, Fraktionsbüros oder das Beschäftigen von Mitarbeitern. Fraktionslose Vertreter haben viele dieser Mittel nicht und sind in ihrer Arbeit stark eingeschränkt.</p>
      <p>Gruppen sind in vielen Versammlungen ein kleinerer Zusammenschluss mit weniger Rechten und Mitteln als eine Fraktion, aber mehr als einzelne, fraktionslose Abgeordnete. Wenn zur Gründung einer Fraktion mehr als zwei Vertreter nötig sind können zwei Vertreter i.d.R. eine Gruppe gründen. Achtung: In Niedersachsen hat „Gruppe“ eine andere Bedeutung, und bezeichnet einen Zusammenschluss mehrerer Fraktionen.</p>
      <p>„Keine Fraktionen“ steht für Mandate in Versammlungen, die grundsätzlich keine Fraktionen haben. Meist sind solche Versammlung mit 5 bis 15 Mandaten eher klein. Die politische Arbeit wird dort aber oft von den Fraktionen einer übergeordneten Vertretung getragen (z.B. im Fall eines Ortsrats durch Stadtratsfraktionen).</p>
    </div>
  </div>
  <script type="text/javascript">
  <xsl:text>
    var thisName = 'frkmitgl';
    graphData[thisName] = [];
    graphColors[thisName] = [];
  </xsl:text>
  <xsl:text>graphData[thisName].push(['Fraktionsmitglieder',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type!='none' and @type!='gruppe' and @type!='unknown']]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#f80');</xsl:text>
  <xsl:text>graphData[thisName].push(['Gruppenmitglieder',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type='gruppe']]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#fc5');</xsl:text>
  <xsl:text>graphData[thisName].push(['Fraktionslose',</xsl:text>
  <xsl:value-of select="count(//parlament[fraktion[@type='none']]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#b40');</xsl:text>
  <xsl:text>graphData[thisName].push(['keine Fraktionen',</xsl:text>
  <xsl:value-of select="count(//parlament[not(fraktion)]/mandat)" /><xsl:text>]);</xsl:text>
  <xsl:text>graphColors[thisName].push('#666');</xsl:text>
<!--   <xsl:text>graphData[thisName].push(['unbekannt',</xsl:text> -->
<!--   <xsl:value-of select="count(//parlament[fraktion[@type='unknown']]/mandat)" /><xsl:text>]);</xsl:text> -->
<!--   <xsl:text>graphColors[thisName].push('#333');</xsl:text> -->
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
      <div id="frktypnum" class="jqplotContainer">&#160;</div>
    </div>
    <div class="span7">
      <h2>Fraktionsarten</h2>
      <p>Eine Fraktion muss aus mindestens zwei, je nach Versammlung auch mehr Vertretern bestehen.</p>
      <p>In Vertretungen, in denen es dafür nicht genügend Piraten-Vertreter gibt, gehen diese oft Fraktionszusammenschlüsse ein, in denen Piraten mit Vertretern anderer Parteien eine gemeinsame Fraktion bilden. Diese tragen dann meist einen Namen wie „LOL/PIRATEN-Fraktion“ oder „PIRATEN und WTF“.</p>
      <p>In seltenen Fällen sind Piraten-Vertreter auch Mitglied einer fremden Fraktion, die sich nicht mit der Piratenpartei identifiziert, aber einen Piraten aufnimmt.</p>
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
      <div id="frktyp" class="jqplotContainer">&#160;</div>
    </div>
    <div class="span7">
      <h2>Fraktionsarten (Zahl der Mitglieder)</h2>
      <p>Die stärksten PIRATEN-Fraktionen gibt es in Berlin (<xsl:value-of select="count(//bundesland[@gs='11000000']//mandat)" />&#160;Piraten-Vertreter in <xsl:value-of select="count(//bundesland[@gs='11000000']//fraktion[@type='piraten'])" />&#160;Fraktionen). Ansonsten haben PIRATEN-Fraktionen in der Regel zwei oder drei Mitglieder.</p>
      <p>Die Zahl der Piraten-Vertreter in einer gemeinsamen Fraktionen ist fast immer um eins geringer als die Mindestanzahl für eine eigene Fraktion: meistens einer, manchmal zwei.</p>
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
      <div id="frkpartner" class="jqplotLargeContainer">&#160;</div>
    </div>
    <div class="span7">
      <h2>Fraktionspartner</h2>
      <p>In manchen Fällen sind mehr als zwei Parteien an einer gemeinsamen Fraktion beteiligt. In dieser Darstellung zählt jede beteiligte Partei als einzelner Fraktionspartner, sodass es mehr Fraktionspartner als gemeinsame Fraktionen gibt (<xsl:value-of select="count(//fraktion[@type='gemeinsam']/partner)"/>&#160;Fraktionspartner in <xsl:value-of select="count(//fraktion[@type='gemeinsam'])"/>&#160;gemeinsamen Fraktionen).</p>
      <p>Niedersachsen stellt hier eine Besonderheit dar: Neben gemeinsamen Fraktionen gibt auch Zusammenschlüsse von Fraktionen und/oder Vertretern verschiendener Parteien. Diese Zusammenschlüsse heißen <em>Gruppen</em>. Formal sind Gruppen also keine gemeinsamen Fraktionen; sie treten aber faktisch so auf. Daher werden niedersächsische Gruppen hier als gemeinsame Fraktionen im gewöhnlichen Sinne geführt.</p>
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

</xsl:template>
</xsl:transform>
