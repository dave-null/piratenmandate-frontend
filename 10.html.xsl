<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='10000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Saarland hat als kleinstes Flächenland und zweitkleinstes Bundesland nach Einwohnern keine kreisfreien Städte, sondern nur Landkreise. Eine Ausnahme stellt der Regionalverband Saarbrücken als „Kommunalverband besonderer Art“ dar, einer von dreien bundesweit. (<a href="http://de.wikipedia.org/wiki/Saarland#Verwaltungsgliederung">Wikipedia</a>).</p>
	<p>Die ersten allgemeinen Kommunalwahlen mit Teilnahme der Piratenpartei fanden im Saarland am 25. Mai 2014 statt.</p>
</xsl:template>

</xsl:transform>