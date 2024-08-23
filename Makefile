STYLE_OUT =  ./dist/stylesheet.css
STYLE_DEST ?= ../capyreader/capy/src/main/assets/stylesheet.css
TEMPLATE_OUT = ./dist/template.html
TEMPLATE_DEST ?= ../capyreader/capy/src/main/res/raw/template.html
MERCURY_JS_DEST := ../capyreader/capy/src/main/assets/mercury.js
CUSTOM_EXTRACTOR_JS_DEST := ../capyreader/capy/src/main/assets/custom-extractors.js
MEDIA_LISTENERS_JS_DEST := ../capyreader/capy/src/main/assets/media.js

SHELL:=/usr/bin/env bash

.PHONY: forge clean

build: $(TEMPLATE_DEST) $(STYLE_DEST) $(MEDIA_LISTENERS_JS_DEST)

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

$(TEMPLATE_DEST):  ./views/template.liquid
	cp  ./views/template.liquid $(TEMPLATE_DEST)


$(MERCURY_JS_DEST): ./public/assets/mercury.js
	cp ./public/assets/mercury.js $(MERCURY_JS_DEST)

$(CUSTOM_EXTRACTOR_JS_DEST): ./public/assets/custom-extractors.js
	cp ./public/assets/custom-extractors.js $(CUSTOM_EXTRACTOR_JS_DEST)

$(MEDIA_LISTENERS_JS_DEST): ./public/assets/media.js
	cp ./public/assets/media.js $(MEDIA_LISTENERS_JS_DEST)

.PHONY:
extract:
	npx postlight-parser $(URL) > ./articles/$(FEED).json
