FILE := homework

all: $(FILE).pdf

TEXS := $(wildcard *.tex) $(wildcard */*.tex) $(wildcard */*/*.tex)

main.pdf: $(TEXS)
	pdflatex -shell-escape $(FILE).tex $(FILE).pdf || exit
	pdflatex -shell-escape -interact=nonstopmode > /dev/null $(FILE).tex || exit
	rm -f *.aux *.log *.toc *.out
	rm -rf _minted*
	

%.pdf: %.tex
	pdflatex -shell-escape $< $@
	rm -f *.aux *.log *.toc *.out
	rm -rf _minted*
	
.PHONY: clean

clean:
	rm -f *.aux *.log *.toc *.out *.pdf
	rm -rf _minted*
