<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='10000000']" />
</xsl:template>

<xsl:template match="bundesland">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountlong" /></span>
	</h1>
	<div id="abstract">
		<xsl:apply-templates select="." mode="abtractheader" />
		<p>saariously?</p>
	</div>
	<div id="accordeon">
		<xsl:apply-templates select="gebiet" />
	</div>
	<div id="mapInfo"></div>
</xsl:template>

<xsl:template match="gebiet">
	<div class="gebiet"><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
		<h2>
			<div class="leaflet-label"><xsl:value-of select="@name" /></div>
			<xsl:value-of select="@name" />
		</h2>
		<div class="contentstore">
			<h3>
				<xsl:value-of select="parlament/@name"/>
				<br />
				<xsl:value-of select="@name"/>
			</h3>
			<xsl:apply-templates select="parlament" mode="mandatstraeger" />
			<xsl:apply-templates select="parlament/fraktion" />
			<xsl:apply-templates select="parlament/story" />
			<h3>Links</h3>
				<xsl:apply-templates select="parlament/fraktion" mode="fraktionslink" />
				<xsl:apply-templates select="parlament" mode="rislink" />
				<xsl:apply-templates select="." mode="localpirates" />
		</div>
	</div>
</xsl:template>

</xsl:transform>