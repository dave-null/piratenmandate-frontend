<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='01000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Land Schleswig-Holstein gliedert sich klassisch in kreisfreie Städte und Landkreise (<a href="http://de.wikipedia.org/wiki/Schleswig-Holstein#Verwaltungsgliederung">Wikipedia</a>).</p>
	<p>Am 6. Mai 2018 fanden in Schleswig-Holstein allgemeine Kommunalwahlen statt. Den PIRATEN gelang dabei der Wiedereinzug in die Ratsversammlung der Landeshauptstadt Kiel. (<a href="https://www.statistik-nord.de/wahlen/wahlen-in-schleswig-holstein/kommunalwahlen/">Wahlergebnisse</a>).</p>
</xsl:template>

</xsl:transform>