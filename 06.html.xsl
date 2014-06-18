<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
	<xsl:apply-templates select="//bundesland[@gs='06000000']" />
</xsl:template>

<xsl:template match="bundesland[@gs='06000000']">
  <h1><xsl:value-of select="@name" />
    <span class="info"><xsl:apply-templates select="." mode="mcountshort" /></span>
  </h1>
  <div id="abstract">
    <h2>Hintergrund<span class="opennote"></span></h2>
	<p>Hessen ist als klassisches Flächenland in 5 kreisfreie Städte und 21 Landkreise gegliedert (<a href="http://de.wikipedia.org/wiki/Liste_der_Landkreise_und_kreisfreien_St%C3%A4dte_in_Hessen">Wikipedia</a>).</p>
	<p>Die zwischen der Landesregierung und den Landkreisen und Kreisfreien Städten bestehenden Regierungsbezirke Kassel, Gießen und Darmstadt haben keine politischen Vertretungen. Dafür sind ihre Gebiete jeweils identisch mit den sogenannten „Planungsregionen“ Nordhessen, Mittelhessen und Südhessen. Jeder dieser Planungsregionen hat eine „Regionalversammlung“, die für Regionalplanung zuständig ist. Sie werden nicht direkt, sondern von den Vertretungen großer Mitgliedskörperschaften gewählt (<a href="http://www.rp-giessen.hessen.de/irj/RPGIE_Internet?cid=8ae2a5f3afcbdad860baac5ffb2216e4">Quelle</a>).</p>
	<p>Zu den Kommunalwahlen in Hessen am 27. März 2011 traten die PIRATEN in insgesamt zehn Landkreisen und zehn Städten zu Wahlen der Kreistage und <em>Stadtverordnetenversammlungen</em> an und konnten mit Ergebnissen zwischen 1,1% und 3,4% in all diesen Kommunalparlamenten Mandate gewinnen (<a href="http://wiki.piratenpartei.de/HE:Kommunalwahl2011/Ergebnisse">Übersicht über die Wahlergebnisse</a>).</p>
  </div>
  <div id="accordeon">
    <xsl:apply-templates select="gebiet[@type='Planungsregion']" mode="flaechenomap" />
    <xsl:apply-templates select="gebiet[@type!='Planungsregion']" mode="flaechetop" />
  </div>
  <div id="mapInfo"></div>
</xsl:template>

</xsl:transform>