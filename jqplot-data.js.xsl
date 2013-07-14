<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output method="text" encoding="UTF-8" />

  <xsl:key name="exparteien" match="mandat[@type='transfer' and not(@multi)]" use="@from" />
  <xsl:key name="fraktionspartner" match="partner" use="@partei" />

  <xsl:template match="/">
    <xsl:text>var pc = [];&#10;</xsl:text>
    <xsl:text>var data = [];&#10;</xsl:text>
    <xsl:for-each select="//mandat[@type='transfer'][generate-id() = generate-id(key('exparteien', @from)[1])]">
      <xsl:sort select="count(key('exparteien', @from))" data-type="number"  order="descending" />
        <xsl:text>data.push([</xsl:text>
        <xsl:text>'</xsl:text><xsl:value-of select="@from" /><xsl:text>',</xsl:text>
        <xsl:value-of select="count(key('exparteien', @from))" />
        <xsl:text>]);&#10;</xsl:text>
        <xsl:text>pc.push(Pc['</xsl:text><xsl:value-of select="@from" /><xsl:text>']);&#10;</xsl:text>
    </xsl:for-each>
    <xsl:text>var data2 = [];&#10;</xsl:text>
    <xsl:text>var pc2 = [];&#10;</xsl:text>
    <xsl:for-each select="//partner[generate-id() = generate-id(key('fraktionspartner', @partei)[1])]">
      <xsl:sort select="count(key('fraktionspartner', @partei))" data-type="number"  order="descending" />
        <xsl:text>data2.push([</xsl:text>
        <xsl:text>'</xsl:text><xsl:value-of select="@partei" /><xsl:text>',</xsl:text>
        <xsl:value-of select="count(key('fraktionspartner', @partei))" />
        <xsl:text>]);&#10;</xsl:text>
        <xsl:text>pc2.push(Pc['</xsl:text><xsl:value-of select="@partei" /><xsl:text>']);&#10;</xsl:text>
    </xsl:for-each>
  </xsl:template>

</xsl:transform>
