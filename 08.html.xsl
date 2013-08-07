<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='08000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Land Baden-Württemberg gliedert sich in kreisfreie Städte und Landkreise, die zu vier Regierungsbezirken gehören. Die Regierungsbezirke haben allerdings keine direkt gewählten Vertretungen. (<a href="http://de.wikipedia.org/wiki/Baden-W%C3%BCrttemberg#Verwaltungsgliederung">Wikipedia</a>).</p>
	<p>An allgemeinen Kommunalwahlen hat die Piratenpartei in Baden-Württemberg noch nicht teilgenommen.</p>
</xsl:template>

</xsl:transform>