# beamer-lake-fig

[![GitHub](https://img.shields.io/github/license/jsta/beamer-lake-fig.svg?color=blue)](http://www.latex-project.org/lppl.txt)
[![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/jsta/beamer-lake-fig.svg?label=current%20version)](https://github.com/jsta/beamer-lake-fig/releases/latest)
[![CTAN](https://img.shields.io/ctan/v/beamer-lake-fig.svg)](https://ctan.org/pkg/beamer-lake-fig)

A collection of customizable lake diagrams for use in LaTeX documents.

## Usage

You can fork this repo and call diagram commands in your document by setting `beamer-lake-fig.sty` as an input (e.g. `\usepackage{beamer-lake-fig}`)

Each command takes a single argument specifiying the scale of the diagram

```latex
\documentclass{standalone}
\usepackage{beamer-lake-fig}

\begin{document}
	
z\lakediagramgreen[0.4]
	
\end{document}
```
## Prerequsites

### LaTeX packages

| | |
| ----------- | ----------- |
| import      | pbox       |
| pgfplots    | subfiles   |

## Gallery

See [beamer-lake-fig.pdf](https://github.com/jsta/beamer-lake-fig/blob/master/beamer-lake-fig.pdf)

## Links

This collection inspired by [JLDiaz](https://tex.stackexchange.com/questions/95044/create-diagrams-in-latex-with-tikz)
