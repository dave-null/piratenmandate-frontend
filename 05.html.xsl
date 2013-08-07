<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='05000000']" mode="flaeche" />
</xsl:template>

<xsl:template match="bundesland" mode="abstract">
	<p>Die kommunale Selbstverwaltung in Nordrhein-Westfalen ist deutlich vielschichtiger gegliedert als in anderen Flächenländern (u.a. in Landschaftsverbände, Regierungsbezirke, Regionalverband, Landesverband). Die typische Struktur von kreisfreien Städten und Kreisen  mit Stadträten und Kreistagen gibt es auch hier (<a href="http://de.wikipedia.org/wiki/Politisches_System_Nordrhein-Westfalens#Kommunale_Selbstverwaltung">Wikipedia</a>).</p>
	<p>Die Städteregion Aachen ist ein „Kommunalverband besonderer Art“, ähnlich wie die Region Hannover in Niedersachsen. (<a href="http://de.wikipedia.org/wiki/St%C3%A4dteregion_Aachen">Wikipedia</a>).</p>
	<p>Bei den Kommunalwahlen am 30. August 2009 konnten die PIRATEN in die Stadträte von Münster und Aachen einziehen und so ihre ersten kommunalen Mandate gewinnen. In beiden Städte wurden die PIRATEN fünftstärkste Liste und gewannen mit 1,7% in Aachen (<a href="http://www.aachen.de/de/stadt_buerger/politik_verwaltung/wahlen1/kommunalwahl/kommunalwahl2009/index.html">Wahlergebnis</a>) und 1,6% in Münster (<a href="http://www.stadt-muenster.de/wahlen/kommunal2009/Rat/index.html">Wahlergebnis</a>) jeweils einen Sitz im Stadtrat.</p>
</xsl:template>

</xsl:transform>