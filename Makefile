TEMPLATE_DEST ?= ../capyreader/capy/src/main/res/raw/template.html
STYLE_DEST ?= ../capyreader/capy/src/main/res/raw/stylesheet.css
JS_DEST ?= ../capyreader/capy/src/main/res/raw/mercury.js

SHELL:=/usr/bin/env bash

.PHONY: forge

build: $(TEMPLATE_DEST) $(STYLE_DEST) $(JS_DEST)

forge:
	bundle install
	ruby main.rb

$(STYLE_DEST): ./public/stylesheet.css
	cp ./public/stylesheet.css $(STYLE_DEST)

$(TEMPLATE_DEST): ./views/template.liquid
	cp ./views/template.liquid $(TEMPLATE_DEST)


$(JS_DEST): ./public/mercury.web.js
	cp ./public/mercury.web.js $(JS_DEST)
