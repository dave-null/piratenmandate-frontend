<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='11000000']" />
</xsl:template>

<xsl:template match="bundesland">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountlong" /></span>
	</h1>
	<div id="abstract">
		<xsl:apply-templates select="." mode="abtractheader" />
		<p>Die Organe der bezirklichen Selbstverwaltung der Stadt Berlin heißen <em>Bezirksverordnetenversammlungen</em> (kurz BVV). Sie wählen den Bezirksbürgermeister und die fünf Bezirksstadträte, die das Bezirksamt leiten. Darüber hinaus ist ihr Einfluss auf das Bezirksamt sehr begrenzt (Wikipedia).</p>
		<p>Bei den gemeinsamen Wahlen zum Berliner Abgeordenetenhaus und den BVVen am 18. September 2011 konnten die PIRATEN mit Ergebnissen zwischen 6,0 % und 14,3 % in alle 12 BVVen einziehen (Wahlergebnis). Von 59 gewonnenen Mandaten bleiben acht unbesetzt, da in fünf Bezirken die Wahllisten zu kurz waren und Kandidaten zugleich ins Abgeordnetenhaus gewählt wurden.</p>
	</div>
	<div id="accordeon">
		<xsl:apply-templates select="gebiet" mode="stadtstaat" />
	</div>
	<div id="mapInfo"></div>
</xsl:template>

</xsl:transform>