<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" />

<xsl:template match="*">
  <xsl:text>var gc = [];&#10;</xsl:text>
  <xsl:apply-templates mode="colors" select="//gebiet|//bundesland" />
</xsl:template>

<xsl:template match="gebiet|bundesland" mode="colors">
  <xsl:text>gc["</xsl:text>
    <xsl:apply-templates mode="key" select="." />
  <xsl:text>"] = </xsl:text>
    <xsl:choose>
      <xsl:when test=".//fraktion[@type='piraten']">
        <xsl:text>"F"</xsl:text>
      </xsl:when>
      <xsl:when test=".//fraktion[@type='gemeinsam'] or .//fraktion[@type='gruppe']">
        <xsl:text>"G"</xsl:text>
      </xsl:when>
      <xsl:when test=".//mandat[@type='pirat' and not(@fremdliste)]">
        <xsl:text>"P"</xsl:text>
      </xsl:when>
      <xsl:otherwise>
        <xsl:text>"Ü"</xsl:text>
      </xsl:otherwise>
    </xsl:choose>
  <xsl:text>;&#10;</xsl:text>
</xsl:template>

<xsl:template match="gebiet|bundesland" mode="key">
  <xsl:choose><xsl:when test="@gs">
    <xsl:value-of select="@gs"/>
  </xsl:when><xsl:otherwise>
    <xsl:value-of select="../@gs"/><xsl:text>_</xsl:text><xsl:value-of select="@localkey"/><xsl:value-of select="@arbkey"/>
  </xsl:otherwise></xsl:choose>
</xsl:template>

<!--<xsl:template match="gebiet" mode="keylist">
  <xsl:apply-templates mode="key" select="." />
  <xsl:text>&#09;</xsl:text>
  <xsl:value-of select="@type"/><xsl:text> </xsl:text><xsl:value-of select="@name"/>
  <xsl:text> </xsl:text>
  <xsl:text>&#10;</xsl:text>
</xsl:template>-->

</xsl:transform>