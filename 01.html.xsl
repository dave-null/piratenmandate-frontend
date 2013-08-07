<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='01000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Land Schleswig-Holstein gliedert sich klassisch in kreisfreie Städte und Landkreise (<a href="http://de.wikipedia.org/wiki/Schleswig-Holstein#Verwaltungsgliederung">Wikipedia</a>).</p>
	<p>Am 26. Mai 2013 fanden in Schleswig-Holstein allgemeine Kommunalwahlen statt. Die PIRATEN konnten dabei insgesamt vierzehn Mandate gewinnen (<a href="http://www.statistik-nord.de/wahlen/wahlen-in-schleswig-holstein/kommunalwahlen/2013/">Wahlergebnisse</a>).</p>
</xsl:template>

</xsl:transform>