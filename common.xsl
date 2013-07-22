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
		<xsl:text>Piratenpartei vor Ort</xsl:text>
	</a>
</xsl:template>

<xsl:template match="parlament" mode="mandatsliste">
  <ul class="prose">
    <xsl:for-each select="mandat">
      <li><xsl:value-of select="." /></li>
    </xsl:for-each>
  </ul>
</xsl:template>

<xsl:template match="parlament" mode="rislink">
  <a class="rislink"><xsl:attribute name="href"><xsl:value-of select="./ris" /></xsl:attribute>
    <xsl:text>Ratsinformationssystem</xsl:text>
  </a>
</xsl:template>

<xsl:template match="parlament" mode="seats">
  <xsl:value-of select="count(./mandat)"/>
  <xsl:text> von </xsl:text>
  <xsl:value-of select="@seats" />
  <xsl:text> Sitzen</xsl:text>
</xsl:template>

</xsl:transform>