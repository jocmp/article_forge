TEMPLATE_DEST ?= ../capyreader/basil/src/main/res/raw/template.html
STYLE_DEST ?= ../capyreader/basil/src/main/res/raw/stylesheet.css

SHELL:=/usr/bin/env bash

.PHONY: forge

build: $(TEMPLATE_DEST) $(STYLE_DEST)

forge:
	bundle install
	ruby main.rb

$(STYLE_DEST): ./public/stylesheet.css
	cp ./public/stylesheet.css $(STYLE_DEST)

$(TEMPLATE_DEST): ./views/template.liquid
	cp ./views/template.liquid $(TEMPLATE_DEST)
