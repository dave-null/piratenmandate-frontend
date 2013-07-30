<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="/">
	<h1>Deutschland
		<span class="info"><xsl:apply-templates select="/" mode="mcountshort" /></span>
	</h1>
	<p>Die Piratenpartei Deutschland hält zur Zeit <xsl:value-of select="count(//mandat[@type='pirat'])" />&#160;kommunale Mandate in <xsl:value-of select="count(//bundesland[descendant::mandat[@type='pirat']])" />&#160;Bundesländern, die bei Wahlen gewonnen wurden.</p>
	<p>Dazu kommen <xsl:value-of select="count(//mandat[@type='transfer'])" />&#160;Mandate von übergetretenen Mandatsträgern, die auf anderen Listen gewählt wurden.</p>
	<p>Manche Mandatsträger üben mehrere Mandate aus. Die Piratenpartei hat <xsl:value-of select="count(//mandat[@type='pirat' and not(@multi)])" />&#160;gewählte und <xsl:value-of select="count(//mandat[@type='transfer' and not(@multi)])" />&#160;übergetretene Mandatsträger.</p>
	<xsl:apply-templates select="//bundesland" />
	<script type="text/javascript">landblockInit();</script>
</xsl:template>

<xsl:template match="bundesland">
	<div class="landblock">
	<xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
		<h3>
			<div class="leaflet-label"><xsl:value-of select="@name" /></div>
			<xsl:value-of select="@type" /><xsl:text> </xsl:text><xsl:value-of select="@name" />
		</h3>
		<xsl:apply-templates select="." mode="mcountshort" />
	</div>
</xsl:template>

</xsl:transform>