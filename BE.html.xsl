<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<h1>Berlin
		<span class="info"><xsl:value-of select="count(//bundesland[@gs='11000000']//mandat)" /> Mandate</span>
	</h1>
	<div id="abstract">
		<xsl:apply-templates select="/" mode="abtractheader" />
		<p>Die Organe der bezirklichen Selbstverwaltung der Stadt Berlin heißen <em>Bezirksverordnetenversammlungen</em> (kurz BVV). Sie wählen den Bezirksbürgermeister und die fünf Bezirksstadträte, die das Bezirksamt leiten. Darüber hinaus ist ihr Einfluss auf das Bezirksamt sehr begrenzt (Wikipedia).</p>
		<p>Bei den gemeinsamen Wahlen zum Berliner Abgeordenetenhaus und den BVVen am 18. September 2011 konnten die PIRATEN mit Ergebnissen zwischen 6,0 % und 14,3 % in alle 12 BVVen einziehen (Wahlergebnis). Von 59 gewonnenen Mandaten bleiben acht unbesetzt, da in fünf Bezirken die Wahllisten zu kurz waren und Kandidaten zugleich ins Abgeordnetenhaus gewählt wurden.</p>
	</div>
	<div id="accordeon">
		<xsl:apply-templates select="//bundesland[@gs='11000000']/gebiet" />
	</div>
	<div id="mapInfo" class="content"></div>
</xsl:template>

<xsl:template match="gebiet">
	<div class="gebiet"><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
		<h2>
			<div class="leaflet-label"><xsl:value-of select="@name" /></div>
			<xsl:value-of select="@type" /><xsl:text> </xsl:text><xsl:value-of select="@name" />
		</h2>
		<div class="content">
			<h3>
				<xsl:value-of select="parlament/@name"/>
				<br />
				<xsl:value-of select="@name"/>
			</h3>
			<xsl:apply-templates select="parlament" mode="mandatstraeger" />
			<xsl:apply-templates select="parlament/fraktion" />
			<xsl:apply-templates select="parlament/story" />
			<h3>Links</h3>
				<xsl:apply-templates select="parlament/fraktion" mode="fraktionslink" />
				<xsl:apply-templates select="parlament" mode="rislink" />
				<xsl:apply-templates select="." mode="localpirates" />
		</div>
	</div>
</xsl:template>

</xsl:transform>