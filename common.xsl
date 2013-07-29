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
	<xsl:value-of select="count(.//mandat)" /><xsl:text> Mandate</xsl:text>
	<xsl:if test=".//mandat[@type='transfer']">
		<xsl:choose><xsl:when test="count(//mandat) = count(.//mandat[@type='transfer'])">
			<xsl:text> durch Übertritt</xsl:text>
		</xsl:when><xsl:otherwise>
			<xsl:text> (</xsl:text><xsl:value-of select="count(.//mandat[@type='transfer'])"/><xsl:text> durch Übertritt)</xsl:text>
		</xsl:otherwise></xsl:choose>
	</xsl:if>
</xsl:template>

<xsl:template match="piratenmandate|bundesland|gebiet" mode="abtractheader"> <!-- Yes, this is abusing XSL. Sorry. -->
	<h2>Hintergrund<span class="opennote"></span></h2>
</xsl:template>

<xsl:template match="parlament" mode="mandatstraeger">
	<div>
		<h4>Mandatsträger</h4>
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
		<h4>Fraktion</h4>
		<xsl:choose>
			<xsl:when test="@type = 'piraten'">PIRATEN-Fraktion</xsl:when>
			<xsl:when test="@type = 'none'">keine</xsl:when>
			<xsl:otherwise>unbekannt</xsl:otherwise>
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
		<xsl:text>Piratenpartei vor Ort</xsl:text>
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


</xsl:transform>