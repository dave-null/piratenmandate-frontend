<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='06000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Hessen ist als klassisches Flächenland in fünf kreisfreie Städte und 21 Landkreise gegliedert (<a href="http://de.wikipedia.org/wiki/Liste_der_Landkreise_und_kreisfreien_St%C3%A4dte_in_Hessen">Wikipedia</a>).</p>
	<p>Zu den Kommunalwahlen in Hessen am 27. März 2011 traten die PIRATEN in insgesamt zehn Landkreisen und zehn Städten zu Wahlen der Kreistage und <em>Stadtverordnetenversammlungen</em> an und konnten mit Ergebnissen zwischen 1,1% und 3,4% in all diesen Kommunalparlamenten Mandate gewinnen. Zudem wurden drei Mandate in Ortsbeiräten gewonnen (<a href="http://wiki.piratenpartei.de/HE:Kommunalwahl2011/Ergebnisse">Übersicht über die Wahlergebnisse</a>).</p>
</xsl:template>

</xsl:transform>