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
		<xsl:apply-templates select="gebiet[./parlament]" mode="bayernbezirke" />
		<xsl:apply-templates select="//gebiet[@type='Bezirk']/gebiet" mode="flaechetop" />
	</div>
	<div id="mapInfo"></div>
</xsl:template>

<xsl:template match="gebiet" mode="bayernbezirke">
	<div class="gebiet middle" ><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
		<h2>
			<div class="leaflet-label"><xsl:text>Bezirk </xsl:text><xsl:value-of select="@name" /></div>
			<xsl:text>Bezirk </xsl:text><xsl:value-of select="@name" />
		</h2>
		<div class="contentstore">
			<h3>
				Bezirk <xsl:value-of select="@name"/>
				<br />
				<xsl:value-of select="./parlament/@name" />
			</h3>
			<xsl:apply-templates select="./parlament" mode="flaecheparl" />
		</div>
	</div>
	<xsl:if test="position()=last()">
		<div class="toplistdivide" />
	</xsl:if>
</xsl:template>

</xsl:transform>