.PHONY: all build submit

all: tikz-lake-fig-doc.pdf example.png

build: ctan.R tikz-lake-fig-doc.pdf
	Rscript $< --build
	-@rm *.log *.out *.aux *.nav *.toc *.snm 2>/dev/null || true

submit: ctan.R tikz-lake-fig-doc.pdf
	Rscript $< --submit

tikz-lake-fig-doc.pdf: tikz-lake-fig-doc.tex tikz-lake-fig.sty
	pdflatex $<
	
example.png: example.tex
	pdflatex $<
	# convert example.pdf -interpolative-resize 484x example.pdf
	convert -density 300 example.pdf -quality 100 $@
	convert $@ -interpolative-resize 484x $@
	convert -flatten $@ $@
	-@rm *.log *.out *.aux *.nav *.toc *.snm 2>/dev/null || true
	