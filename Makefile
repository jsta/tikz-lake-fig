.PHONY: all

all: main.pdf

main.pdf: main.tex beamer-lake-fig.tex
	pdflatex main.tex
