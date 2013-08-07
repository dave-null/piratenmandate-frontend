<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='16000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Land Thüringen gliedert sich klassisch in kreisfreie Städte und Landkreise (<a href="http://de.wikipedia.org/wiki/Th%C3%BCringen#Verwaltungsgliederung">Wikipedia</a>).</p>
	<p>An allgemeinen Kommunalwahlen hat die Piratenpartei in Thüringen noch nicht teilgenommen.</p>
	<p>Bei Nachwahlen zu den Ortsteilräten in Jena, die im August 2010 nach einer Umgliederung der Stadt durchgeführt wurden, hatten die PIRATEN zwei Mandate in zwei Ortsteilräten gewonnen (<a href="http://www.jena.de/statistik/wahl/wahl2010/ot/orat.php">Wikipedia</a>). Da das Wahlrecht aber keine Nachrücker zulässt, sind inzwischen beide Mandate wegen Umzugs der Mandatsträger verfallen.</p>
</xsl:template>

</xsl:transform>