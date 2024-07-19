TEMPLATE_OUT = ./dist/template.html
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

$(TEMPLATE_OUT): ./views/template.liquid
	ruby ./script/generate-android-template

$(TEMPLATE_DEST): $(TEMPLATE_OUT)
	cp  $(TEMPLATE_OUT) $(TEMPLATE_DEST)


$(JS_DEST): ./public/mercury.js
	cp ./public/mercury.js $(JS_DEST)
