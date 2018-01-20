REPORT=gost-report
MAIN_TEX_FILE=main.tex

.PHONY: $(REPORT) all clean

%.tex: %.raw
	./raw2tex $< > $@

%.tex: %.dat
	./dat2tex $< > $@

$(REPORT).pdf: $(MAIN_TEX_FILE)
	latexmk -pdf -xelatex -jobname="$(REPORT)" -use-make $(MAIN_TEX_FILE)

clean:
	latexmk -xelatex -jobname="$(REPORT)" -CA