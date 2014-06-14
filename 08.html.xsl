<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='08000000']" />
</xsl:template>

<xsl:template match="bundesland[@gs='08000000']">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountshort" /></span>
	</h1>
	<div id="abstract">
		<h2>Hintergrund<span class="opennote"></span></h2>
  <p>Das Land Baden-Württemberg gliedert sich in kreisfreie Städte und Landkreise, die jeweils zu einem von vier Regierungsbezirken gehören. Die Regierungsbezirke haben allerdings keine direkt gewählten Vertretungen (<a href="http://de.wikipedia.org/wiki/Baden-W%C3%BCrttemberg#Verwaltungsgliederung">Wikipedia</a>).</p>
  <p>Zusätzlich zu den Regierungsbezirken gibt es die sogenannten Regionalverbände, denen jeweils mehrere Land- und Stadtkreise angehören, und die für Aufgaben der Regionalplanung zuständig sind. Von den 12 Regionalverbänden hat allerdings einzig die Region Stuttgart eine direkt gewählte Vertretung, nämlich die „Regionalversammlung des Verbands Region Stuttgart“ (<a href="http://de.wikipedia.org/wiki/Regionalverb%C3%A4nde_in_Baden-W%C3%BCrttemberg">Wikipedia</a>).</p>
  <p>Die ersten allgemeinen Kommunalwahlen mit Teilnahme der Piratenpartei fanden in Baden-Württemberg am 25. Mai 2014 statt.</p>
	</div>
	<div id="accordeon">
    <xsl:apply-templates select="gebiet[@type='Regionalverband']" mode="flaechenomap" />
		<xsl:apply-templates select="gebiet[@type!='Regionalverband']" mode="flaechetop" />
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

</xsl:transform>