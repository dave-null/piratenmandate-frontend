outdir=_out

jsrequired=jquery.min.js jqPlot leaflet leaflet.label.js leaflet.label.css

index=karte
sections=statistik about kontakt

datadir=data
datenfiles=statistik.data.html gebietsdata.js 0.html 01.html 02.html 03.html 05.html 06.html 07.html 08.html 10.html 11.html 12.html 13.html 14.html 15.html 16.html

#ausgruenden darf ein target nicht wie ein existierendes verzeichnis heissen!
all: javascript headfoot styles datadir json

headfoot:
	cat header.html $(index).part.html footer.html > $(outdir)/index.html
	$(foreach file,$(sections), cat header.html $(file).part.html footer.html > $(outdir)/$(file).html;)

styles:
	cp -r css csslocal fonts img $(outdir)

javascript:
	mkdir -p $(outdir)/js/
	$(foreach script,$(jsrequired), cp -r js/$(script) $(outdir)/js/;)
	cp -r jslocal $(outdir)

datadir:
	mkdir -p $(datadir)
	$(foreach template,$(datenfiles),xsltproc $(template).xsl piratenmandate.xml > $(datadir)/$(template);)
	echo $(shell date -d"$(shell stat -c %y piratenmandate.xml)" +%d.%m.%Y) > $(datadir)/date
	cp -r $(datadir) $(outdir)

json:
	cp -r geojson $(outdir)

clean:
	rm -rf ./$(outdir)/*
	rm -rf ./$(datadir)/*