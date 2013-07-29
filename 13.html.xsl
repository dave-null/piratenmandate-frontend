<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='13000000']" />
</xsl:template>

<xsl:template match="bundesland">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountlong" /></span>
	</h1>
	<div id="abstract">
		<xsl:apply-templates select="." mode="abtractheader" />
		<p>MV tut gut</p>
	</div>
	<div id="accordeon">
		<xsl:apply-templates select="gebiet" mode="genericflaeche" />
	</div>
	<div id="mapInfo"></div>
</xsl:template>

</xsl:transform>