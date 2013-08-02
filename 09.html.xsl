<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='09000000']" />
</xsl:template>

<xsl:template match="bundesland[@gs='09000000']">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountlong" /></span>
	</h1>
	<div id="abstract">
		<h2>Hintergrund<span class="opennote"></span></h2>
			<p>mia san mia</p>
	</div>
	<div id="accordeon">
<!-- 		<xsl:apply-templates select="gebiet[@name='Bremerhaven']" mode="flaechetop" /> -->
<!-- 		<div class="toplistdivide" /> -->
		<xsl:apply-templates select="//gebiet[@type='Bezirk']/gebiet" mode="flaechetop" />
	</div>
	<div id="mapInfo"></div>
</xsl:template>

</xsl:transform>