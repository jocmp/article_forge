STYLE_OUT =  ./dist/stylesheet.css
STYLE_DEST ?= ../capyreader/capy/src/main/assets/stylesheet.css
TEMPLATE_OUT = ./dist/template.html
TEMPLATE_DEST ?= ../capyreader/capy/src/main/res/raw/template.html
JS_DEST ?= ../capyreader/capy/src/main/assets/mercury.js

SHELL:=/usr/bin/env bash

.PHONY: forge clean

build: $(TEMPLATE_DEST) $(STYLE_DEST) $(JS_DEST)

.PHONY: forge
forge:
	bundle install
	bundle exec rerun main.rb -b --ignore "*.css"

clean:
	rm -f dist/*

$(STYLE_OUT): ./style/stylesheet.scss
	ruby ./script/generate-android-style

$(STYLE_DEST): $(STYLE_OUT)
	cp $(STYLE_OUT) $(STYLE_DEST)

$(TEMPLATE_OUT): ./views/template.liquid
	ruby ./script/generate-android-template

$(TEMPLATE_DEST): $(TEMPLATE_OUT)
	cp  $(TEMPLATE_OUT) $(TEMPLATE_DEST)


$(JS_DEST): ./public/assets/mercury.js
	cp ./public/assets/mercury.js $(JS_DEST)
