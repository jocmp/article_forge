SHELL:=/usr/bin/env bash

.PHONY: forge

forge:
	bundle install
	ruby main.rb
