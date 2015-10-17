ALL = cv.en.pdf cv.fr.pdf cv.public.en.pdf cv.public.fr.pdf

all: $(ALL)

%.pdf: %.tex setup.tex cv.tex
	pdflatex -interaction=nonstopmode $<
