Frontend für piratenmandate
===========================
Dies ist eine Aufbereitung der XML-Daten der kommunalen Piratenmandate aus [diesem Repository](https://github.com/emtiu/piratenmandate) als Webseite.

9. JavaScript-Pakete im Verzeichnis `js/` ablegen:
  * [jQuery](http://jquery.com/)
  * [jqPlot](http://www.jqplot.com/)
  * [leaflet](http://leafletjs.com/)
  * [leaflet.label](https://github.com/Leaflet/Leaflet.label)
9. [Bootstrap](http://twitter.github.io/bootstrap/) in `css/` ablegen
9. Das [`piratenmandate`-Repository](https://github.com/emtiu/piratenmandate) als Ordner im Haupverzeichnis ablegen
9. `make` ausführen

Die Dateien im Verzeichnis `_out` sollten dann den auf [kommunalpiraten.de](http://www.kommunalpiraten.de) gehosteten entsprechen.

Struktur
--------
* `js/`, `css/`: Externe Pakete
* `jslocal/`, `csslocal/`: Eigener Code und Styles
* `fonts/`, `img/`: Fonts, Bilder, Sprites
* `geojson/`: Geoinformationen, selbst angepasst aus Daten vom [BKG](http://www.bkg.bund.de/) und [OpenStreetMap](http://www.openstreetmap.org/)
* `*.xsl` Stylesheets zum automatischen Generieren von Inhalten aus der `piratenmandate.xml`

Troubleshooting
---------------
* Das Makefile verwendet `xsltproc` zum Anwenden der XSL-Stylesheets. Das Programm muss vorhanden sein, kann aber theoretisch durch einen kompatiblen XSLT 1.0-Prozessor ersetzt werden.
