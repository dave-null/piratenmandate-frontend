<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='03000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Die Gliederung Niedersachsens ist durch die Niedersächsische Kommunalverfassung geregelt (<a href="http://de.wikipedia.org/wiki/Nieders%C3%A4chsisches_Kommunalverfassungsgesetz">Wikipedia</a>). Neben dem sonderfall der Region Hannover gibt es hier wie üblich kreisfreie Städte und Landkreise.</p>
	<p>Die Landkreise gliedern sich wiederum in Gemeinden, die selbst Städte, Einheits- oder Samtgemeinden sein können – wobei Städte und Einheitsgemeinden in Ortsteile, Samtgemeinden aber nur in („Mitglieds-“)Gemeinden aufgeteilt sein können. Großen Städte haben Stadtbezirke statt Ortschaften. Die gewählten Vertretungen sind jeweils der Stadtrat, der Kreistag, der (Samt-)Gemeinderat und der Ortsrat bzw. Stadtbezirksrat. (<a href="http://de.wikipedia.org/wiki/Nieders%C3%A4chsische_Gemeindeordnung">Wikipedia</a>)</p>
</xsl:template>

</xsl:transform>