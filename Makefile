outdir=_out

jsrequired=accordeon.js jquery.min.js jqPlot leaflet leaflet.label.js leaflet.label.css

index=karte
sections=statistik about kontakt

datadir=data
datenfiles=statistik.data.html gebietsdata.js

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

datadir:
	mkdir -p $(datadir)
	$(foreach template,$(datenfiles),xsltproc $(template).xsl piratenmandate.xml > $(datadir)/$(template);)
	echo $(shell date -d"$(shell stat -c %y piratenmandate.xml)" +%d.%m.%Y) > $(datadir)/date
	cp -r jslocal $(datadir) $(outdir)

json:
	cp -r geojson $(outdir)

clean:
	rm -rf ./$(outdir)/*
	rm -rf ./$(datadir)/*