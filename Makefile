outdir=_out

jsrequired=accordeon.js jquery.min.js jqPlot

index=karte
sections=statistik about kontakt

datadir=data
datenfiles=jqplot-data.js
mDate=$(shell date -d"$(shell stat -c %y piratenmandate.xml)" +%d.%m.%Y)

#ausgruenden darf ein target nicht wie ein existierendes verzeichnis heissen!
all: javascript headfoot styles datadir

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
	echo "var mDate = '$(mDate)';" > $(datadir)/date.js
	cat date.part.js >> $(datadir)/date.js
	cp -r jslocal $(datadir) $(outdir)

clean:
	rm -rf ./$(outdir)/*
	rm -rf ./$(datadir)/*