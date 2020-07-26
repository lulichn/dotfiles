
.DEFAULT_GOAL := help


install: install-brew install-mitamae ## Install

.PHONY:	install-brew
install-brew: ## Install homebrew
ifeq ($(shell uname), Darwin)
ifeq ($(shell command -v brew 2> /dev/null),)
	curl https://raw.githubusercontent.com/Homebrew/install/master/install.sh | /bin/bash
endif
endif

.PHONY:	install-mitamae
install-mitamae: ## Install Mitamae
	./bin/setup install

.PHONY: setup
setup: ## Setup
	./bin/mitamae local ./lib/bootstrap.rb

.PHONY:	brew
brew: brew-upgrade brew-bundle ## Brew

.PHONY:	brew-upgrade
brew-upgrade: ## Upgrade formula
	brew upgrade

.PHONY:	brew-bundle
brew-bundle: ## Bundle install
	./bin/mitamae local ./cookbooks/brew-bundle/default.rb

.PHONY:	backup
backup:
	./backup/dump.sh

.PHONY:	help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'