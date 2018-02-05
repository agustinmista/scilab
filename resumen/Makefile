all: tex pdf

pdf:
	pandoc *_*.md --toc --pdf-engine=xelatex -o resumen.pdf
	
tex: 
	pandoc *_*.md --toc --pdf-engine=xelatex -o resumen.tex
