<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='11000000']" mode="stadtstaat" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Land Berlin ist eine sogenannte Einheitsgemeinde. Das bedeutet, dass alle Aufgaben, die in anderen Ländern von Landkreisen und Gemeinden wahrgenommen werden, in der Zuständigkeit der Berliner Landesregierung liegen.</p>
	<p>Einen Teil dieser Aufgaben überlässt die Landesregierung den Bezirken. Dort werden die Bezirksverordnetenversammlungen direkt gewählt. Sie wählen den Bezirksbürgermeister und die vier Bezirksstadträte, die das Bezirksamt leiten. Darüber hinaus ist ihr Einfluss auf das Bezirksamt sehr begrenzt (<a href="http://de.wikipedia.org/wiki/Bezirksverordnetenversammlung">Wikipedia</a>).</p>
	<p>Bei den gemeinsamen Wahlen zum Berliner Abgeordenetenhaus und den BVVen am 18. September 2011 konnten die PIRATEN mit Ergebnissen zwischen 6,0% und 14,3% in alle 12 BVVen einziehen (<a href="http://www.wahlen-berlin.de/wahlen/BE2011/ergebnis/karten/Bvv/bvv_bez.asp">Wahlergebnis</a>). Von 59 gewonnenen Mandaten bleiben acht unbesetzt, da in fünf Bezirken die Wahllisten zu kurz waren und Kandidaten zugleich ins Abgeordnetenhaus gewählt wurden.</p>
	<p>Alle vier in die BVV Reinickendorf gewählten Mandatsträger sind inzwischen aus der Piratenpartei ausgetreten.</p>
</xsl:template>

</xsl:transform>
