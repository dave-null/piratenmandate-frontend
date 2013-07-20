<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="key.xsl" />

<xsl:template match="*">
  <div class="row-fluid">
    <div id="content-head" class="content-head span12">
      <h2>Berlin</h2>
      <span id="content-head-mandate"><xsl:value-of select="count(//bundesland[@gs='11000000']//mandat)" /> Mandate</span>
    </div>
      <p>lorem ispum dolor sit amet</p>
      <p>lorem ispum dolor sit amet</p>
  </div>
  <div id="accordeon">
    <xsl:apply-templates select="//bundesland[@gs='11000000']/gebiet" />
  </div>
</xsl:template>

<xsl:template match="gebiet">
  <div class="nav-tile">
    <xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
    <a href="javascript:void(0);"><xsl:value-of select="@name" /></a>
  </div>
  <div class="pan-content">
    <xsl:attribute name="id"><xsl:apply-templates select="." mode="key" />-content</xsl:attribute>
    <p>Dinge™</p>
  </div>
</xsl:template>

</xsl:transform>