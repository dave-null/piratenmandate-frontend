<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='15000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Land Sachsen-Anhalt gliedert sich klassisch in kreisfreie Städte und Landkreise (<a href="http://de.wikipedia.org/wiki/Sachsen-Anhalt#Verwaltungsgliederung">Wikipedia</a>).</p>
	<p>Eine Besonderheit der Kommunalgliederung stellen die Verbandsgemeinden dar, zu denen Gemeinden zusammengeschlossen werden können, um Verwaltungsaufgaben zentral wahrzunehmen. Verbandsgemeinden haben einen direkt gewählten Verbandsgemeinderat, die Mitgliedsgemeinden aber auch Gemeinderäte. Diese Einrichtung ist analog zur Kommunalgliederung von Rheinland-Pfalz und ähnlich den Samtgemeinden in Niedersachsen.</p>
	<p>Die ersten allgemeinen Kommunalwahlen mit Teilnahme der Piratenpartei fanden in Sachsen-Anhalt am 25. Mai 2014 statt.</p>
</xsl:template>

</xsl:transform>