<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='04000000']" />
</xsl:template>

<xsl:template match="bundesland[@gs='04000000']">
	<h1><xsl:value-of select="@name" />
		<span class="info"><xsl:apply-templates select="." mode="mcountlong" /></span>
	</h1>
	<div id="abstract">
		<h2>Hintergrund<span class="opennote"></span></h2>
			<p>Das Land Bremen besteht aus den Städten Bremen und Bremerhaven.</p>
			<p>Die Bremer Stadtbürgerschaft setzt sich allerdings fast ausschließlich aus einem Teil der Abgeordneten der Bremischen (Landes-)Bürgerschaft zusammen. Zudem gibt es in der Stadt Bremen 22 direkt gewählte Orts- und Stadtteilbeiräte. Bei den gemeinsamen Bürgerschafts- und Kommunalwahlen am 22. Mai 2011 konnten die PIRATEN in vier Bremer Stadtteilbeiräten mit Ergebnissen zwischen 3,1% und 3,9% jeweils als fünftstarkste Liste ein Mandat gewinnen (<a href="http://www.statistik.bremen.de/sixcms/media.php/13/Stat%20Mitt114_KW2011.pdf">Wahlergebnis</a>). Ein Teil dieser Mandate ist inzwischen aus verschienen Gründen wieder verloren gegangen.</p>
			<p>Die gewählte Bürgervertretung der Stadt Bremerhaven ist ihre Stadtverordnetenversammlung (<a href="http://de.wikipedia.org/wiki/Freie_Hansestadt_Bremen#Verwaltungsgliederung">Wikipedia</a>). Dort konnten die PIRATEN mit 2,2% ein Mandat in der Stadtverordnetenversammlung gewinnen (<a href="http://www.bremerhaven.de/meer-erleben/stadt-haus/wahlen-zur-bremischen-buergerschaft-und-zur-stadtverordnetenversammlung.23527.html">Wahlergebnis</a>).</p>
	</div>
	<div id="accordeon">
		<xsl:apply-templates select="gebiet[@name='Bremerhaven']" mode="flaechetop" />
		<div class="divider" />
		<xsl:apply-templates select="gebiet[@gs='04011000']/gebiet" mode="bremenstadtteil" />
	</div>
	<div id="mapInfo"></div>
</xsl:template>

<xsl:template match="gebiet" mode="bremenstadtteil">
	<div class="gebiet" ><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
		<h2>
			<div class="leaflet-label"><xsl:text>Bremen: Stadtteil </xsl:text><xsl:value-of select="@name" /></div>
			<xsl:text>Bremen: Stadtteil </xsl:text><xsl:value-of select="@name" />
		</h2>
		<div class="contentstore">
			<xsl:apply-templates select="." mode="flaechegebiet" />
		</div>
	</div>
</xsl:template>

</xsl:transform>