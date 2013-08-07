<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='13000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Land Mecklenburg-Vorpommern gliedert sich klassisch in kreisfreie Städte und Landkreise (<a href="http://de.wikipedia.org/wiki/Mecklenburg-Vorpommern#Verwaltungsgliederung">Wikipedia</a>).</p>
	<p>An allgemeinen Kommunalwahlen hat die Piratenpartei in Sachsen noch nicht teilgenommen.</p>
	<p>Bei Nachwahlen der Kreistage, die im September 2011 nach einer Umgliederung Landkreise durchgeführt wurden, hatten die PIRATEN ein Mandat in einem Kreistag gewonnen (<a href="http://service.mvnet.de/cgi-bin/wahlen/2011_kom_land/wahl2011_anz.pl?K_Sonstige.htm">Wikipedia</a>). Das Mandat ging allerdings mit dem Parteiausschluss des Mandatsträgers verloren.</p>
</xsl:template>

</xsl:transform>