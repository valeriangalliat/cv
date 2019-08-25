ALL = cv.en.pdf cv.fr.pdf

all: $(ALL)

.PHONY: dist
dist: all
	if [ ! -d dist ]; then git clone -b gh-pages $$(git remote get-url origin) dist; fi
	cp *.pdf dist
	cd dist && git commit -am 'Update' && git push

.PHONY: watch
watch:
	inotifywait -me close_write *.tex | while read l; do make; done

%.pdf: %.tex setup.tex cv.tex
	pdflatex -interaction=nonstopmode $<
