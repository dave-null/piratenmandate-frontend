<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

<xsl:template match="gebiet|bundesland" mode="key">
  <xsl:choose><xsl:when test="@gs">
    <xsl:value-of select="@gs"/>
  </xsl:when><xsl:otherwise>
    <xsl:value-of select="../@gs"/><xsl:text>_</xsl:text><xsl:value-of select="@localkey"/><xsl:value-of select="@arbkey"/>
  </xsl:otherwise></xsl:choose>
</xsl:template>

<xsl:template match="gebiet" mode="localpirates">
	<a class="localpirateslink">
		<xsl:attribute name="href"><xsl:value-of select="ancestor-or-self::*[@localpirates][1]/@localpirates"/></xsl:attribute>
		<xsl:attribute name="title">Zur lokalen Gliederung der Piratenpartei</xsl:attribute>
		<xsl:text>Piraten vor Ort</xsl:text>
	</a>
</xsl:template>

<xsl:template match="parlament" mode="mandatstraeger">
	<div>
		<h4>Mandatsträger (<xsl:value-of select="count(./mandat)"/> von <xsl:value-of select="@seats" /> Sitzen)</h4>
		<ul class="prose">
			<xsl:for-each select="mandat">
				<li><xsl:value-of select="." /></li>
			</xsl:for-each>
		</ul>
	</div>
</xsl:template>

<xsl:template match="parlament" mode="fraktion">
	<div>
		<h4>Fraktion</h4>
		<xsl:choose>
			<xsl:when test="fraktion/@type = 'piraten'">PIRATEN-Fraktion</xsl:when>
			<xsl:when test="fraktion/@type = 'none'">keine</xsl:when>
			<xsl:otherwise>unbekannt</xsl:otherwise>
		</xsl:choose>
		<xsl:if test="./fraktion/@url">
			<a><xsl:attribute name="href"><xsl:value-of select="./fraktion/@url"/></xsl:attribute>Homepage</a>
		</xsl:if>
	</div>
</xsl:template>

<xsl:template match="story">
	<div>
		<xsl:value-of select="." />
		<xsl:if test="@source">
			<a><xsl:attribute name="href"><xsl:value-of select="@source"/></xsl:attribute>Quelle</a>
		</xsl:if>
	</div>
</xsl:template>

<xsl:template match="parlament" mode="rislink">
	<a class="rislink">
		<xsl:attribute name="href"><xsl:value-of select="./ris" /></xsl:attribute>
		<xsl:attribute name="class">rislink</xsl:attribute>
		<xsl:attribute name="title">Zum Ratsinformationssystem</xsl:attribute>
		<xsl:text>RIS</xsl:text>
	</a>
</xsl:template>

</xsl:transform>