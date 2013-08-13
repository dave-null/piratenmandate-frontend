<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="bundesland|gebiet" mode="key">
  <xsl:choose><xsl:when test="@gs">
    <xsl:value-of select="@gs"/>
  </xsl:when><xsl:otherwise>
    <xsl:value-of select="../@gs"/><xsl:text>_</xsl:text><xsl:value-of select="@localkey"/><xsl:value-of select="@arbkey"/>
  </xsl:otherwise></xsl:choose>
</xsl:template>

<xsl:template match="piratenmandate|bundesland|gebiet" mode="mcountlong">
	<xsl:value-of select="count(.//mandat)" /><xsl:text> Mandat</xsl:text>
	<xsl:if test="count(.//mandat) > 1"><xsl:text>e</xsl:text></xsl:if>

	<xsl:if test=".//mandat[@type='transfer']">
		<xsl:choose><xsl:when test="count(.//mandat) = count(.//mandat[@type='transfer'])">
			<xsl:text> durch Übertritt</xsl:text>
		</xsl:when><xsl:otherwise>
			<xsl:text> (</xsl:text><xsl:value-of select="count(.//mandat[@type='transfer'])"/><xsl:text> durch Übertritt)</xsl:text>
		</xsl:otherwise></xsl:choose>
	</xsl:if>
</xsl:template>

<xsl:template match="piratenmandate|bundesland|gebiet" mode="mcountshort">
	<xsl:choose><xsl:when test="count(.//mandat) = count(.//mandat[@type='transfer'])">
		<xsl:value-of select="count(.//mandat[@type='transfer'])" />
		<xsl:text>&#160;Übertritt</xsl:text>
		<xsl:if test="count(.//mandat[@type='transfer']) > 1"><xsl:text>e</xsl:text></xsl:if>
	</xsl:when><xsl:otherwise>
		<xsl:value-of select="count(.//mandat[@type='pirat'])" />
		<xsl:text> Mandat</xsl:text>
		<xsl:if test="count(.//mandat[@type='pirat']) > 1"><xsl:text>e</xsl:text></xsl:if>
		<xsl:if test=".//mandat[@type='transfer']">
			<xsl:text> (+</xsl:text>
			<xsl:value-of select="count(.//mandat[@type='transfer'])"/>
			<xsl:text>&#160;Übertritt</xsl:text>
			<xsl:if test="count(.//mandat[@type='transfer']) > 1"><xsl:text>e</xsl:text></xsl:if>
			<xsl:text>)</xsl:text>
		</xsl:if>
	</xsl:otherwise></xsl:choose>
</xsl:template>

<xsl:template match="parlament" mode="mandatstraeger">
	<div>
		<h5>Mandatsträger</h5>
		<ul class="prose">
			<xsl:for-each select="mandat">
				<li><xsl:value-of select="." /></li>
			</xsl:for-each>
		</ul>
		<xsl:text> (</xsl:text>
			<xsl:value-of select="count(./mandat)"/><xsl:text> von </xsl:text><xsl:value-of select="@seats" />
		<xsl:text> Sitzen)</xsl:text>
	</div>
</xsl:template>

<xsl:template match="fraktion">
	<div>
		<h5>Fraktion</h5>
		<xsl:choose>
			<xsl:when test="@type = 'piraten'"><strong>PIRATEN-Fraktion</strong></xsl:when>
			<xsl:when test="@type = 'gemeinsam'">
				<xsl:text>Gemeinsame Fraktion </xsl:text><strong>&#8222;<xsl:value-of select="@name" />&#8220;</strong><xsl:text>, mit </xsl:text>
					<ul class="prose">
					<xsl:for-each select="partner">
						<li><xsl:value-of select="@partei" /> (<xsl:value-of select="@num" />)</li>
					</xsl:for-each>
					</ul>
			</xsl:when>
			<xsl:when test="@type = 'fremd'">
				Mitglied der Fraktion <strong>&#8222;<xsl:value-of select="@name" />&#8220;</strong>
			</xsl:when>
			<xsl:when test="@type = 'none'">keine (fraktionslos)</xsl:when>
			<xsl:when test="@type = 'unknown'"><em>unbekannt</em></xsl:when>
		</xsl:choose>
	</div>
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

<xsl:template match="fraktion[@url]" mode="fraktionslink">
	<p><a>
		<xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
		<xsl:attribute name="title">Zur Homepage der Fraktion</xsl:attribute>
		<xsl:text>Fraktionshomepage</xsl:text>
	</a></p>
</xsl:template>


<xsl:template match="bundesland" mode="stadtstaat">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountlong" /></span>
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
			<xsl:apply-templates select="parlament" mode="mandatstraeger" />
			<xsl:apply-templates select="parlament/fraktion" />
			<xsl:apply-templates select="parlament/story" />
			<h3>Links</h3>
				<xsl:apply-templates select="parlament/fraktion" mode="fraktionslink" />
				<xsl:apply-templates select="parlament" mode="rislink" />
				<xsl:apply-templates select="." mode="localpirates" />
		</div>
	</div>
</xsl:template>


<xsl:template match="bundesland" mode="flaeche">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountlong" /></span>
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
		<xsl:attribute name="class">level<xsl:value-of select="count(ancestor::gebiet)" /></xsl:attribute>
		<h3>
			<xsl:value-of select="@name"/>
			<xsl:if test="count(ancestor::gebiet) = 0">
				<span class="pull-right"> (<xsl:apply-templates select="." mode="mcountshort" />)</span>
			</xsl:if>
			<xsl:if test="count(ancestor::gebiet) > 0">
				<xsl:text> (</xsl:text><xsl:value-of select="@type"/><xsl:text>)</xsl:text>
			</xsl:if>
		</h3>
		<xsl:apply-templates select="parlament" mode="flaecheparl" />
		<xsl:apply-templates select="gebiet" mode="flaechegebiet" /> <!-- HOLY COW, HE'S RECURSING! -->
	</div>
</xsl:template>

<xsl:template match="parlament" mode="flaecheparl">
  <h4><xsl:value-of select="@name" /></h4>
	<xsl:apply-templates select="." mode="mandatstraeger" />
	<xsl:apply-templates select="fraktion" />
	<xsl:apply-templates select="story" />
	<div class="smalllinks">
		<h5>Links</h5>
			<xsl:apply-templates select="fraktion" mode="fraktionslink" />
			<xsl:apply-templates select="." mode="rislink" />
			<xsl:apply-templates select=".." mode="localpirates" />
	</div>
</xsl:template>

</xsl:transform>