<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='12000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Das Land Brandenburg gliedert sich klassisch in kreisfreie Städte und Landkreise (<a href="http://de.wikipedia.org/wiki/Brandenburg#Landkreise_und_kreisfreie_St.C3.A4dte">Wikipedia</a>).</p>
	<p>An allgemeinen Kommunalwahlen hat die Piratenpartei in Brandenburg noch nicht teilgenommen.</p>
</xsl:template>

</xsl:transform>