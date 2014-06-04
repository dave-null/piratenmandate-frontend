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
	<p>Die Bezirksversammlungen wurden zuletzt am 25. Mai 2014 gewählt, erstmals zusammen mit dem Europaparlament (vorher, zuletzt 2011, zusammen mit der Hamburgischen Bürgerschaft). Dabei konnten die PIRATEN im Bezirk Hamburg-Mitte mit 4,4% zum zweiten Mal in Folge die 3-Prozent-Hürde überspringen und zwei Mandate gewinnen. Im Bezirk Hamburg-Nord sind die PIRATEN mit 3,5% erstmals in die Bezirksversammlung eingezogen.</p>
</xsl:template>

</xsl:transform>