<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='02000000']" mode="stadtstaat" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Land Hamburg ist eine sogenannte Einheitsgemeinde. Das bedeutet, dass alle Aufgaben, die in anderen Ländern von Landkreisen und Gemeinden wahrgenommen werden, in der Zuständigkeit der Hamburger Landesregierung liegen.</p>
	<p>Einen Teil dieser Aufgaben überlässt die Landesregierung den Bezirken. Sie werden von den direkt gewählten Bezirksversammlungen kontrolliert. Sie wählen den Bezirksamtsleiter und können für das Bezirksamt bindende Beschlüsse fassen. (<a href="http://de.wikipedia.org/wiki/Bezirksversammlung">Wikipedia</a>).</p>
	<p>Die Bezirksversammlungen wurden zuletzt am 20. Februar 2011 gemeinsam mit der Hamburgischen Bürgerschaft gewählt. Dabei konnten die PIRATEN im Bezirk Hamburg-Mitte mit 4,7% die 3-Prozent-Hürde überspringen und zwei Mandate gewinnen. Im Bezirk Bergedorf gewannen die PIRATEN ein Direktmandat (<a href="http://www.statistik-nord.de/wahlen/wahlen-in-hamburg/bezirksversammlungswahlen/2011/">Wahlergebnis</a>).</p>
	<p>Inzwischen wurde die 3-Prozent-Hürde vom Hamburgischen Verfassungsgericht für unwirksam erklärt. Um eine Fraktion zu gründen, die aus mindestens drei Abgeordneten bestehen muss, ist aber weiterhin ein Wahlergebnis von rund 5% erforderlich.</p>
</xsl:template>

</xsl:transform>