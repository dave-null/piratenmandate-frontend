outdir=_out
jsrequired=accordeon.js jquery.min.js jqPlot

index=karte
sections=statistik about kontakt

datenfiles=jqplot-data.js

#ausgruenden darf ein target nicht wie ein existierendes verzeichnis heissen!
all: javascript headfoot styles datadir

headfoot:
	cat header.html $(index).part.html footer.html > $(outdir)/index.html
	$(foreach file,$(sections), cat header.html $(file).part.html footer.html > $(outdir)/$(file).html;)

styles:
	cp -r css fonts img $(outdir)

javascript:
	mkdir -p $(outdir)/js/
	$(foreach script,$(jsrequired), cp -r js/$(script) $(outdir)/js/;)

datadir:
	$(foreach template,$(datenfiles),xsltproc $(template).xsl piratenmandate.xml > data/$(template);)
	cp -r data $(outdir)

clean:
	rm -rf ./$(outdir)/*
