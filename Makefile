.PHONY: all build submit

all: tikz-lake-fig-doc.pdf

build: ctan.R tikz-lake-fig-doc.pdf
	Rscript $< --build
	-@rm *.log *.out *.aux *.nav *.toc *.snm 2>/dev/null || true

submit: ctan.R tikz-lake-fig-doc.pdf
	Rscript $< --submit

tikz-lake-fig-doc.pdf: tikz-lake-fig-doc.tex tikz-lake-fig.sty
	pdflatex $<
	