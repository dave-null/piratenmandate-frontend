<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
  <div class="row-fluid">
    <div id="content-head" class="content-head span12">
      <h2>Berlin</h2>
      <span id="content-head-mandate"><xsl:value-of select="count(//bundesland[@gs='11000000']//mandat)" /> Mandate</span>
    </div>
      <small><p>Die Organe der bezirklichen Selbstverwaltung der Stadt Berlin heißen <em>Bezirksverordnetenversammlungen</em> (kurz BVV). Sie wählen den Bezirksbürgermeister und die fünf Bezirksstadträte, die das Bezirksamt leiten. Darüber hinaus ist ihr Einfluss auf das Bezirksamt sehr begrenzt (Wikipedia).</p>
      <p>Bei den gemeinsamen Wahlen zum Berliner Abgeordenetenhaus und den BVVen am 18. September 2011 konnten die PIRATEN mit Ergebnissen zwischen 6,0 % und 14,3 % in alle 12 BVVen einziehen (Wahlergebnis). Von 59 gewonnenen Mandaten bleiben acht unbesetzt, da in fünf Bezirken die Wahllisten zu kurz waren und Kandidaten zugleich ins Abgeordnetenhaus gewählt wurden.</p></small>
  </div>
  <div id="accordeon">
    <xsl:apply-templates select="//bundesland[@gs='11000000']/gebiet" />
  </div>
</xsl:template>

<xsl:template match="gebiet">
  <div class="nav-tile"><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
    <a href="javascript:void(0);"><xsl:value-of select="@name" /></a>
  </div>

  <div class="pan-content"><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" />-content</xsl:attribute>
    <xsl:apply-templates select="./parlament" mode="rislink" />
    <h4>Mandatsträger (<xsl:apply-templates select="./parlament" mode="seats" />)</h4>
      <xsl:apply-templates select="./parlament" mode="mandatsliste" />
    <xsl:apply-templates select="./parlament/story" />
  </div>
</xsl:template>

<xsl:template match="story">
  <h4>Story</h4>
  <p><xsl:value-of select="." /></p>
</xsl:template>

</xsl:transform>