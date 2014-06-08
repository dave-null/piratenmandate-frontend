<?xml version="1.0" encoding="UTF-8"?>
<xsl:transform version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
<xsl:output encoding="UTF-8" omit-xml-declaration="yes"/>

<xsl:include href="common.xsl" />

<xsl:template match="*">
  <xsl:apply-templates select="//bundesland[@gs='05000000']" />
</xsl:template>

<xsl:template match="bundesland[@gs='05000000']">
  <h1><xsl:value-of select="@name" />
    <span class="info"><xsl:apply-templates select="." mode="mcountlong" /></span>
  </h1>
  <div id="abstract">
    <h2>Hintergrund<span class="opennote"></span></h2>
      <p>Die kommunale Selbstverwaltung in Nordrhein-Westfalen ist deutlich vielschichtiger als in anderen Flächenländern, und besteht zum Teil aus historisch gewachsenen, parallelen Strukturen mit vielfältigen räumlichen und administrativen Zuständigkeiten (u.a. Landschaftsverbände, Regierungsbezirke, Regionalverband, Landesverband).</p>
      <p>Darunter existiert die typische Struktur von kreisfreien Städten und Kreisen, die in Städte und Gemeinden unterteilt sind (<a href="http://de.wikipedia.org/wiki/Politisches_System_Nordrhein-Westfalens#Kommunale_Selbstverwaltung">Wikipedia</a>). Ausnahme ist die Städteregion Aachen als „Kommunalverband besonderer Art“ (<a href="http://de.wikipedia.org/wiki/St%C3%A4dteregion_Aachen">Wikipedia</a>).</p>
      <p>Bei den Kommunalwahlen 2009 konnten die PIRATEN in Münster und Aachen mit jeweils einem Sitz im Stadtrat ihre ersten kommunalen Mandate gewinnen. Zu den Kommunalwahlen am 25. Mai 2014 sind die PIRATEN erstmals flächendeckend angetreten.</p>
  </div>
  <div id="accordeon">
    <xsl:apply-templates select="gebiet[@type='Bezirk'][parlament]" mode="flaechenomap" />
    <xsl:apply-templates select="gebiet[@type='Bezirk']/gebiet" mode="flaechetop" />
  </div>
  <div id="mapInfo"></div>
</xsl:template>

<xsl:template match="gebiet" mode="flaechenomap">
  <div class="gebiet nomap" ><xsl:attribute name="id"><xsl:apply-templates select="." mode="key" /></xsl:attribute>
    <h2>
      <div class="leaflet-label">Regierungsbezirk <xsl:value-of select="@name" /></div>
      Regierungsbezirk <xsl:value-of select="@name" />
    </h2>
    <div class="contentstore">
      <div class="level0">
        <h3>
          <xsl:value-of select="@name"/>
        </h3>
        <xsl:apply-templates select="parlament" mode="flaecheparl" />
      </div>
    </div>
  </div>
  <xsl:if test="position()=last()">
    <div class="divider" />
  </xsl:if>
</xsl:template>

</xsl:transform>