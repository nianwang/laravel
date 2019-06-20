default: help

-include .*.makefile

## This help screen
help:
	@printf "Available targets:\n\n"
	@awk '/^[a-zA-Z\-\_0-9%:\\]+/ { \
		helpMessage = match(lastLine, /^## (.*)/); \
		if (helpMessage) { \
			helpCommand = $$1; \
			helpMessage = substr(lastLine, RSTART + 3, RLENGTH); \
			gsub("\\\\", "", helpCommand); \
			gsub(":+$$", "", helpCommand); \
			printf "  \x1b[32;01m%-12s\x1b[0m %s\n", helpCommand, helpMessage; \
		} \
	} \
	{ lastLine = $$0 }' $(MAKEFILE_LIST) | sort -u
	@printf "\n"

## Builds assets
build: install
	@npm run dev

## Clears generated assets
clean:
	@#do nothing

## Prepare for distribution
dist: install
	@npm run prod

## Clears all dependencies
distclean: clean
	@rm -rf node_modules
	@rm -rf vendor

## Installs dependencies
install: .env node_modules vendor

## Opens a testing session
watch: export HOST?=127.0.0.1
watch: export PORT?=8000
watch: install
	@php artisan serve --quiet --host=$(HOST) --port=$(PORT) &
	@npm run watch

# dependencies

.env: .env.example vendor
	@[ -f ".env" ] || (cp .env.example .env && php artisan key:generate)

node_modules: package.json
	@npm install

vendor: composer.json
	@composer install

.PHONY: build clean dist distclean install watch
