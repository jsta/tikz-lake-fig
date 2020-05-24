# tikz-lake-fig

[![GitHub](https://img.shields.io/github/license/jsta/tikz-lake-fig.svg?color=blue)](http://www.latex-project.org/lppl.txt)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/jsta/tikz-lake-fig.svg?label=current%20version)](https://github.com/jsta/tikz-lake-fig/releases/latest)
[![CTAN](https://img.shields.io/ctan/v/tikz-lake-fig.svg)](https://ctan.org/pkg/tikz-lake-fig)

A collection of customizable lake diagrams for use in LaTeX documents.

## Usage

You can fork this repo and call diagram commands in your document by setting `tikz-lake-fig.sty` as an input (e.g. `\usepackage{tikz-lake-fig}`)

Each command takes a single argument specifiying the scale of the diagram

```latex
\documentclass{standalone}
\usepackage{tikz-lake-fig}

\begin{document}
	
\lakediagramgreen[0.4]
	
\end{document}
```
## Prerequsites

### LaTeX packages

| import          | pbox         |
| --------------- | ------------ |
| __pgfplots__    | __subfiles__ |

## Gallery

See [tikz-lake-fig-doc.pdf](https://github.com/jsta/tikz-lake-fig/blob/master/tikz-lake-fig-doc.pdf)

## Links

This collection inspired by [JLDiaz](https://tex.stackexchange.com/questions/95044/create-diagrams-in-latex-with-tikz)
