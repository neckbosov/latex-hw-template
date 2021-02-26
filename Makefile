FILE := homework

all: $(FILE).pdf

TEXS := $(wildcard *.tex) $(wildcard */*.tex) $(wildcard */*/*.tex)

$(FILE).pdf: $(TEXS)
	pdflatex -shell-escape $(FILE).tex $(FILE).pdf || exit
	pdflatex -shell-escape -interact=nonstopmode > /dev/null $(FILE).tex || exit
	rm -f *.aux *.log *.toc *.out *.fdb_latexmk *.fls *.dvi
	rm -rf _minted*
	
.PHONY: clean

clean:
	rm -f *.aux *.log *.toc *.out *.pdf *.fdb_latexmk *.fls *.dvi
	rm -rf _minted*
