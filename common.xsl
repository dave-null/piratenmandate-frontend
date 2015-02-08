<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="bundesland|gebiet" mode="key">
  <xsl:choose><xsl:when test="@gs">
    <xsl:value-of select="@gs"/>
  </xsl:when><xsl:otherwise>
    <xsl:value-of select="../@gs"/><xsl:text>_</xsl:text><xsl:value-of select="@localkey"/><xsl:value-of select="@arbkey"/>
  </xsl:otherwise></xsl:choose>
</xsl:template>

<xsl:template match="piratenmandate|bundesland|gebiet" mode="mcountshort">
	<xsl:choose><xsl:when test="count(.//mandat) = count(.//mandat[@type!='pirat'])">
		<xsl:value-of select="count(.//mandat[@type!='pirat'])" />
		<xsl:text>&#160;Fremdliste</xsl:text>
	</xsl:when><xsl:otherwise>
		<xsl:value-of select="count(.//mandat[@type='pirat'])" />
		<xsl:text> Mandat</xsl:text>
		<xsl:if test="count(.//mandat[@type='pirat']) > 1"><xsl:text>e</xsl:text></xsl:if>
		<xsl:if test=".//mandat[@type!='pirat']">
			<xsl:text> (+</xsl:text>
			<xsl:value-of select="count(.//mandat[@type!='pirat'])"/>
			<xsl:text>&#160;Fremdliste)</xsl:text>
		</xsl:if>
	</xsl:otherwise></xsl:choose>
</xsl:template>

<xsl:template match="parlament" mode="mandatstraeger">
	<div>
		<h5>Mandatsträger (<xsl:value-of select="count(./mandat)"/><xsl:text> von </xsl:text><xsl:value-of select="@seats" /> Sitzen)</h5>
		<ul class="prose">
			<xsl:for-each select="mandat">
				<li>
          <xsl:value-of select="." />
          <xsl:apply-templates select="@email" />
          <xsl:if test="@type='fremdliste'"><xsl:text> (gewählt über die Liste </xsl:text>
            <xsl:choose>
              <xsl:when test="@name">
                <xsl:text>&#8222;</xsl:text><xsl:value-of select="@name" /><xsl:text>&#8220;)</xsl:text>
              </xsl:when>
              <xsl:otherwise>
                <xsl:text>der </xsl:text><xsl:value-of select="@from" /><xsl:text>)</xsl:text>
              </xsl:otherwise>
            </xsl:choose>
          </xsl:if>
				</li>
			</xsl:for-each>
		</ul>
	</div>
</xsl:template>

<xsl:template match="fraktion">
	<div>
		<h5>Fraktion</h5>
		<xsl:choose>
			<xsl:when test="@type='piraten'"><strong>PIRATEN-Fraktion</strong></xsl:when>
			<xsl:when test="@type='gemeinsam'">
				<xsl:text>Gemeinsame Fraktion </xsl:text><strong>&#8222;<xsl:value-of select="@name" />&#8220;</strong><xsl:text>, mit </xsl:text>
				<ul class="prose">
				<xsl:for-each select="partner">
					<li><xsl:value-of select="@num" /> von 
					<xsl:choose>
						<xsl:when test="@name"><xsl:value-of select="@name" /></xsl:when>
						<xsl:otherwise><xsl:value-of select="@partei" /></xsl:otherwise>
					</xsl:choose>
					</li>
				</xsl:for-each>
				</ul>
			</xsl:when>
			<xsl:when test="@type='gruppe'">
				Keine, aber zusammengeschlossen in der Gruppe <strong>&#8222;<xsl:value-of select="@name" />&#8220;</strong>
			</xsl:when>
			<xsl:when test="@type='fremd'">
				Mitglied der Fraktion <strong>&#8222;<xsl:value-of select="@name" />&#8220;</strong>
			</xsl:when>
			<xsl:when test="@type='none'">Keine (fraktionslos)</xsl:when>
			<xsl:when test="@type='unknown'"><em>unbekannt</em></xsl:when>
		</xsl:choose>
		<xsl:apply-templates select="./@url" />
		<xsl:apply-templates select="./@email" />
	</div>
</xsl:template>

<xsl:template match="fraktion/@url">
	<xsl:text>&#160;</xsl:text>
	<a class="small">
		<xsl:attribute name="href"><xsl:value-of select="."/></xsl:attribute>
		<xsl:attribute name="title">Zur Homepage der Fraktion</xsl:attribute>
		<xsl:text>Homepage</xsl:text>
	</a>
</xsl:template>

<xsl:template match="@email">
	<xsl:text>&#160;</xsl:text>
	<a class="small">
		<xsl:attribute name="href"><xsl:text>mailto:</xsl:text><xsl:value-of select="."/></xsl:attribute>
		<xsl:attribute name="title">Kontakt per E-Mail</xsl:attribute>
		<xsl:text>Mail</xsl:text>
	</a>
</xsl:template>

<xsl:template match="story">
	<div>
		<xsl:value-of select="." />
		<xsl:if test="@source">
			<xsl:text> </xsl:text><a class="small"><xsl:attribute name="href"><xsl:value-of select="@source"/></xsl:attribute>Quelle</a>
		</xsl:if>
	</div>
</xsl:template>

<xsl:template match="gebiet" mode="localpirates">
	<p><a>
		<xsl:attribute name="href"><xsl:value-of select="ancestor-or-self::*[@localpirates][1]/@localpirates"/></xsl:attribute>
		<xsl:attribute name="title">Zur lokalen Gliederung der Piratenpartei</xsl:attribute>
		<xsl:text>Piraten vor Ort</xsl:text>
	</a></p>
</xsl:template>

<xsl:template match="parlament" mode="rislink">
	<p><a>
		<xsl:attribute name="href"><xsl:value-of select="@ris" /></xsl:attribute>
		<xsl:attribute name="title">Zum Ratsinformationssystem der Vertretung</xsl:attribute>
		<xsl:text>Ratsinformationssystem</xsl:text>
	</a></p>
</xsl:template>

<xsl:template match="feed" mode="feedlink">
	<p><a>
		<xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>
		<xsl:attribute name="title">Zum Feed mit Neuigkeiten</xsl:attribute>
		<xsl:text>Feed</xsl:text>
	</a></p>
</xsl:template>

<xsl:template match="oa">
  <p><a>
    <xsl:attribute name="href"><xsl:value-of select="@url" /></xsl:attribute>
    <xsl:text>Eigenen Antrag bei </xsl:text>
    <img src="img/openantrag.png" alt="OpenAntrag-Logo"></img>
    <xsl:text> vorschlagen</xsl:text>
  </a></p>
</xsl:template>



<xsl:template match="bundesland" mode="stadtstaat">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountshort" /></span>
	</h1>
	<div id="abstract">
		<h2>Hintergrund<span class="opennote"></span></h2>
		<xsl:apply-templates select="." mode="abstract" />
	</div>
	<div id="accordeon">
		<xsl:apply-templates select="gebiet" mode="stadtstaat" />
	</div>
	<div id="mapInfo"></div>
</xsl:template>

<xsl:template match="gebiet" mode="flaechenomap">
  <div class="gebiet nomap" ><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
    <h2>
      <div class="leaflet-label"><xsl:value-of select="@name" /></div>
      <xsl:value-of select="@name" />
    </h2>
    <div class="contentstore">
      <div class="level0">
        <h3>
          <xsl:value-of select="@name"/>
        </h3>
        <xsl:apply-templates select="parlament" mode="flaecheparl" />
      </div>
    </div>
  </div>
  <xsl:if test="position()=last()">
    <div class="divider" />
  </xsl:if>
</xsl:template>

<xsl:template match="gebiet" mode="stadtstaat" >
	<div class="gebiet"><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
		<h2>
			<div class="leaflet-label"><xsl:value-of select="@name" /></div>
			<xsl:value-of select="@type" /><xsl:text> </xsl:text><xsl:value-of select="@name" />
		</h2>
		<div class="contentstore">
			<h3>
				<xsl:value-of select="parlament/@name"/>
				<br />
				<xsl:value-of select="@name"/>
			</h3>
			<xsl:apply-templates select="parlament/oa" />
			<xsl:apply-templates select="parlament" mode="mandatstraeger" />
			<xsl:apply-templates select="parlament/fraktion" />
			<xsl:apply-templates select="parlament/story" />
			<h3>Links</h3>
				<xsl:apply-templates select="parlament" mode="rislink" />
				<xsl:apply-templates select="." mode="localpirates" />
				<xsl:apply-templates select="feed" mode="feedlink" />
		</div>
	</div>
</xsl:template>


<xsl:template match="bundesland" mode="flaeche">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountshort" /></span>
	</h1>
	<div id="abstract">
		<h2>Hintergrund<span class="opennote"></span></h2>
		<xsl:apply-templates select="." mode="abstract" />
	</div>
	<div id="accordeon">
		<xsl:apply-templates select="gebiet" mode="flaechetop" />
	</div>
	<div id="mapInfo"></div>
</xsl:template>

<xsl:template match="gebiet" mode="flaechetop">
	<div class="gebiet" ><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
		<h2>
			<div class="leaflet-label"><xsl:value-of select="@name" /></div>
			<xsl:value-of select="@name" />
		</h2>
		<div class="contentstore">
			<xsl:apply-templates select="." mode="flaechegebiet" />
		</div>
	</div>
</xsl:template>

<xsl:template match="gebiet" mode="flaechegebiet">
	<div>
		<xsl:attribute name="class">level<xsl:value-of select="count(ancestor::gebiet[@type != 'Bezirk'])" /></xsl:attribute>
		<h3>
			<xsl:value-of select="@name"/>
			<xsl:if test="count(ancestor::gebiet[@type != 'Bezirk']) = 0">
				<span class="pull-right"><xsl:apply-templates select="." mode="mcountshort" /></span>
			</xsl:if>
			<xsl:if test="count(ancestor::gebiet[@type != 'Bezirk']) > 0">
				<xsl:text> (</xsl:text><xsl:value-of select="@type"/><xsl:text>)</xsl:text>
			</xsl:if>
		</h3>
		<xsl:apply-templates select="parlament" mode="flaecheparl" />
		<xsl:apply-templates select="gebiet" mode="flaechegebiet" /> <!-- HOLY COW, HE'S RECURSING! -->
	</div>
</xsl:template>

<xsl:template match="parlament" mode="flaecheparl">
  <h4><xsl:value-of select="@name" /></h4>
  <xsl:apply-templates select="oa" />
	<xsl:apply-templates select="." mode="mandatstraeger" />
	<xsl:apply-templates select="fraktion" />
	<xsl:apply-templates select="story" />
	<div class="smalllinks">
		<h5>Links</h5>
			<xsl:apply-templates select="." mode="rislink" />
			<xsl:apply-templates select=".." mode="localpirates" />
			<xsl:apply-templates select="feed" mode="feedlink" />
	</div>
</xsl:template>

</xsl:transform>
