Frontend für piratenmandate
===========================
Dieses Repository ist ein Frontend für die von Michael Büker (emtiu) geführten XML-Daten aller kommunalen Piratenmandate in [diesem Repository](https://github.com/emtiu/piratenmandate).

9. JavaScript-Pakete im Verzeichnis `js/` ablegen:
  * [jQuery](http://jquery.com/)
  * [jqPlot](http://www.jqplot.com/)
  * [leaflet](http://leafletjs.com/)
  * [leaflet.label](https://github.com/Leaflet/Leaflet.label)
9. `piratenmandate.xml` und `piratenmandate.dtd` aus [dem `piratenmandate`-Repository](https://github.com/emtiu/piratenmandate) im Haupverzeichnis ablegen
9. `make` ausführen

Die Dateien im Verzeichnis `_out` sollten dann den auf [kommunalpiraten.de](http://www.kommunalpiraten.de) gehosteten entsprechen.

Troubleshooting
---------------
* Das Makefile verwendet `xsltproc` zum Anwenden der XSL-Stylesheets. Das Programm muss vorhanden sein, kann aber theoretisch durch einen kompatiblen XSLT 1.0-Prozessor ersetzt werden.
