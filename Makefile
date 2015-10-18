ALL = cv.en.pdf cv.fr.pdf cv.public.en.pdf cv.public.fr.pdf

all: $(ALL)

watch:
	inotifywait -me close_write *.tex | while read l; do nix-build; done

%.pdf: %.tex setup.tex cv.tex
	pdflatex -interaction=nonstopmode $<
