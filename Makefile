PDF = dist/cv.en.pdf dist/cv.fr.pdf

build: dist $(PDF)

dist:
	git clone --branch gh-pages $$(git remote get-url origin) dist

.PHONY: watch
watch:
	inotifywait -me close_write *.tex | while read l; do make; done

dist/%.pdf: %.tex setup.tex cv.tex
	pdflatex -output-directory=dist -interaction=nonstopmode $<
