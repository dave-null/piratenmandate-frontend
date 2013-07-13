outdir=_out

index=karte
sections=statistik about kontakt

jsrequired=accordeon.js jquery.min.js

all: javascript headfoot styles

headfoot:
	cat header.html $(index).part.html footer.html > $(outdir)/index.html
	$(foreach file,$(sections), cat header.html $(file).part.html footer.html > $(outdir)/$(file).html;)

styles:
	cp -r css fonts img $(outdir)

javascript:
	mkdir -p $(outdir)/js/
	$(foreach script,$(jsrequired), cp -r js/$(script) $(outdir)/js/;)

clean:
	rm -rf ./$(outdir)/*