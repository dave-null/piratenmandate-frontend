<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='04000000']" />
</xsl:template>

<xsl:template match="bundesland[@gs='04000000']">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountlong" /></span>
	</h1>
	<div id="abstract">
		<h2>Hintergrund<span class="opennote"></span></h2>
			<p>Bremen, yo.</p>
	</div>
	<div id="accordeon">
		<xsl:apply-templates select="gebiet[@name='Bremerhaven']" mode="flaechetop" />
		<div style="margin-bottom:1em"></div>
		<xsl:apply-templates select="gebiet[@gs='04011000']/gebiet" mode="bremenstadtteil" />
	</div>
	<div id="mapInfo"></div>
</xsl:template>

<xsl:template match="gebiet" mode="bremenstadtteil">
	<div class="gebiet" ><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
		<h2>
			<div class="leaflet-label">Bremen: Stadtteil <xsl:value-of select="@name" /></div>
			Bremen: Stadtteil <xsl:value-of select="@name" />
		</h2>
		<div class="contentstore">
			<xsl:apply-templates select="." mode="flaechegebiet" />
		</div>
	</div>
</xsl:template>

</xsl:transform>