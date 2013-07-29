<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='02000000']" mode="stadtstaat" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>In Hamburg gibt es weder eine kommunale noch eine bezirkliche Selbstverwaltung. Die Bezirksversammlungen sind Teil der Bezirksämter, die nur in bestimmten Dingen Entscheidungen treffen dürfen, solange die Regierung der Stadt nicht eingreift (Wikipedia).</p>
	<p>Die Bezirksversammlungen wurden zuletzt am 20. Februar 2011 gemeinsam mit der Hamburgischen Bürgerschaft gewählt. Dabei konnten die PIRATEN im Bezirk Hamburg-Mitte mit 4,7 % die 3-Prozent-Hürde überspringen und zwei Mandate gewinnen. Im Bezirk Bergedorf gewannen die PIRATEN ein Direktmandat (Wahlergebnis). Voraussetzung für eine Fraktion sind drei Abgeordnete.</p>
</xsl:template>

</xsl:transform>