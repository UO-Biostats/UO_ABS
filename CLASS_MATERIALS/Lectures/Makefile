SHELL := /bin/bash
# use bash for <( ) syntax

.PHONY : 

# you can change this to the location of your local MathJax.js library
# if you want the MathJax to be loadable offline
MATHJAX = https://cdnjs.cloudflare.com/ajax/libs/mathjax/2.7.1/MathJax.js

# may want to add "--self-contained" to the following
PANDOC_OPTS = --mathjax=$(MATHJAX)?config=TeX-AMS-MML_HTMLorMML --standalone --self-contained
# optionally add in a latex file with macros
LATEX_MACROS = macros.tex
ifeq ($(wildcard $(LATEX_MACROS)),)
	# macros file isn't there
else
	PANDOC_OPTS += -H .pandoc.$(LATEX_MACROS)
endif

.pandoc.$(LATEX_MACROS) : $(LATEX_MACROS)
	(echo '\['; cat $(LATEX_MACROS); echo '\]') > $@

setup : .pandoc.$(LATEX_MACROS)
	@:

# knitr by default tries to interpret ANY code chunk; I only want it to do the ones beginning with ```r.
KNITR_PATTERNS = list( chunk.begin="^```+\\s*\\{[.]?(r[a-zA-Z]*.*)\\}\\s*$$", chunk.end="^```+\\s*$$", inline.code="`r +([^`]+)\\s*`")
# or, uncomment for OSX:
# KNITR_PATTERNS = list( chunk.begin="^```+\\\\s*\\\\{[.]?(r[a-zA-Z]*.*)\\\\}\\\\s*$$", chunk.end="^```+\\\\s*$$", inline.code="`r +([^`]+)\\\\s*`")

%.html : %.Rmd
	# cd $$(dirname $<); Rscript -e 'knitr::knit2html(basename("$<"),output=basename("$@"))'
	# cd $$(dirname $<); Rscript -e 'rmarkdown::render(basename("$<"),output_file=basename("$@"))'
	# Rscript -e 'templater::render_template("$<", output="$@", change.rootdir=TRUE)'
	Rscript -e 'knitr::knit_patterns[["set"]]($(KNITR_PATTERNS)); templater::render_template("$<", output="$@", change.rootdir=TRUE, clean=FALSE)'

%.html : %.md setup
	pandoc -o $@ $(PANDOC_OPTS) $<

%.md : %.Rmd
	# cd $$(dirname $<); Rscript -e 'knitr::knit_patterns[["set"]]($(KNITR_PATTERNS)); knitr::knit(basename("$<"),output=basename("$@"))'
	Rscript -e 'knitr::knit_patterns[["set"]]($(KNITR_PATTERNS)); templater::render_template("$<", output="$@", change.rootdir=TRUE)'

## VARIOUS SLIDE METHODS
REVEALJS_OPTS = -t revealjs -V theme=simple -V slideNumber=true -V transition=none -H resources/adjust-revealjs.style --slide-level 2
SLIDES_OPTS = $(REVEALJS_OPTS)

%.slides.html : %.md setup
	pandoc -o $@ $(SLIDES_OPTS) $(PANDOC_OPTS) $<

%.revealjs.html : %.md setup
	pandoc -o $@ $(REVEALJS_OPTS) $(PANDOC_OPTS) $<

