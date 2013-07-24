<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<h1>Berlin
		<span class="info"><xsl:value-of select="count(//bundesland[@gs='11000000']//mandat)" /> Mandate</span>
	</h1>
	<h2>Informationen zu Kommunalvertretungen in Berlin</h2>
	<p>Die Organe der bezirklichen Selbstverwaltung der Stadt Berlin heißen <em>Bezirksverordnetenversammlungen</em> (kurz BVV). Sie wählen den Bezirksbürgermeister und die fünf Bezirksstadträte, die das Bezirksamt leiten. Darüber hinaus ist ihr Einfluss auf das Bezirksamt sehr begrenzt (Wikipedia).</p>
	<p>Bei den gemeinsamen Wahlen zum Berliner Abgeordenetenhaus und den BVVen am 18. September 2011 konnten die PIRATEN mit Ergebnissen zwischen 6,0 % und 14,3 % in alle 12 BVVen einziehen (Wahlergebnis). Von 59 gewonnenen Mandaten bleiben acht unbesetzt, da in fünf Bezirken die Wahllisten zu kurz waren und Kandidaten zugleich ins Abgeordnetenhaus gewählt wurden.</p>
	<div id="accordeon">
		<xsl:apply-templates select="//bundesland[@gs='11000000']/gebiet" />
	</div>
	<div id="mapInfo" class="content">
		<div><h3>Bezirksverordnetenversammlung<a class="rislink" href="" title="Zum Ratsinformationssystem">RIS</a></h3></div><div><h4>Mandatsträger (4 von 55 Sitzen)</h4><ul class="prose"><li>Tobias Kriesel</li><li>Christopher Lang</li><li>David Kirchner</li><li>Alexander Freitag</li></ul></div><div><h4>Fraktion</h4>PIRATEN-Fraktion<a href="https://bvvmitte.pyxis.uberspace.de/wordpress/">Homepage</a></div><div>Von 6 gewonnenen Sitzen konnten nur 5 besetzt werden, da ein Teil der Listenkandidaten gleichzeitig ins Abgeordnetenhaus gewählt wurde. Im August 2012 legte außerdem eine Bezirksverordnete ihr Amt nieder, ohne dass es Nachrücker gab. Somit sind zwei Sitze in der Versammlung unbesetzt.</div><div><a class="localpirateslink" href="http://www.piraten-mitte.de/" title="Zur lokalen Gliederung der Piratenpartei">Piraten vor Ort</a></div>
	</div>
</xsl:template>

<xsl:template match="gebiet">
	<div class="gebiet"><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
		<h2><xsl:value-of select="@name" /></h2>
		<div class="content">
			<div><h3><xsl:value-of select="parlament/@name"/><xsl:apply-templates select="parlament" mode="rislink" /></h3></div>
			<xsl:apply-templates select="parlament" mode="mandatstraeger" />
			<xsl:apply-templates select="parlament" mode="fraktion" />
			<xsl:apply-templates select="parlament/story" />
			<div><xsl:apply-templates select="." mode="localpirates" /></div>
		</div>
	</div>
</xsl:template>

</xsl:transform>