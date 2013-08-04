outdir=_out

jsrequired=jquery.min.js jqPlot leaflet leaflet.label.js leaflet.label.css

index=karte
sections=about
piecesections=statistik karte

datadir=data
datenfiles=stats.html gebietsdata.js 0.html 01.html 02.html 03.html 04.html 05.html 06.html 07.html 08.html 09.html 10.html 11.html 12.html 13.html 14.html 15.html 16.html

#ausgruenden darf ein target nicht wie ein existierendes verzeichnis heissen!
all: javascript styles datadir assemble json

javascript:
	mkdir -p $(outdir)/js/
	$(foreach script,$(jsrequired), cp -r js/$(script) $(outdir)/js/;)
	cp -r jslocal $(outdir)

styles:
	cp -r css csslocal fonts img $(outdir)

datadir:
	mkdir -p $(datadir)
	$(foreach template,$(datenfiles),xsltproc $(template).xsl piratenmandate/piratenmandate.xml > $(datadir)/$(template);)
	echo $(shell date -d"$(shell stat -c %y piratenmandate/piratenmandate.xml)" +%d.%m.%Y) > $(datadir)/date
	cp -r $(datadir) $(outdir)

assemble:
	mv $(datadir)/0.html karte.center.html
	mv $(datadir)/stats.html statistik.center.html
	$(foreach file,$(piecesections), cat header.html $(file).top.html $(file).center.html $(file).bottom.html footer.html > $(outdir)/$(file).html;)
	mv $(outdir)/karte.html $(outdir)/index.html
	$(foreach file,$(sections), cat header.html $(file).part.html footer.html > $(outdir)/$(file).html;)

json:
	cp -r geojson $(outdir)

clean:
	rm -rf ./$(outdir)/*
	rm -rf ./$(datadir)/*
