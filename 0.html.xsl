<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="/">
	<h1>Deutschland
		<span class="info"><xsl:apply-templates select="/" mode="mcountshort" /></span>
	</h1>
	<p>Die Piratenpartei Deutschland hält zur Zeit <xsl:value-of select="count(//mandat)" />&#160;kommunale Mandate, die von <xsl:value-of select="count(//mandat[not(@multi)])" />&#160;Mandatsträgern ausgeübt werden.</p>
	<p>Davon wurden <xsl:value-of select="count(//mandat[@fremdliste])" />&#160;Mandate von Piraten auf anderen Wahllisten gewonnen. Weitere <xsl:value-of select="count(//mandat[@type='transfer'])" />&#160;Mandate sind durch nachträgliche Parteiübertritte von Mandatsträgern dazugekommen.</p>
	<xsl:apply-templates select="//bundesland" />
	<script type="text/javascript">landblockInit();</script>
</xsl:template>

<xsl:template match="bundesland">
	<div class="landblock">
	<xsl:attribute name="id">L<xsl:value-of select="substring(@gs,1,2)" /></xsl:attribute>
		<h3>
			<div class="leaflet-label"><xsl:value-of select="@name" /></div>
			<xsl:value-of select="@type" /><xsl:text> </xsl:text><xsl:value-of select="@name" />
		</h3>
		<xsl:apply-templates select="." mode="mcountshort" />
	</div>
</xsl:template>

</xsl:transform>