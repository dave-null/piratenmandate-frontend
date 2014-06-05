<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='13000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Land Mecklenburg-Vorpommern gliedert sich klassisch in kreisfreie Städte und Landkreise (<a href="http://de.wikipedia.org/wiki/Mecklenburg-Vorpommern#Verwaltungsgliederung">Wikipedia</a>).</p>
	<p>Die ersten allgemeinen Kommunalwahlen mit Teilnahme der Piratenpartei fanden in Mecklenburg-Vorpommern am 25. Mai 2014 statt.</p>
</xsl:template>

</xsl:transform>
