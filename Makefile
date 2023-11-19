.DEFAULT_GOAL := help

.PHONY:	setup install-brew install-mitamae mitamae brew brew-upgrade brew-bundle help

setup: install-brew install-mitamae ## Prepare toolchains

install-brew: ## Install Homebrew
ifeq ($(shell uname), Darwin)
ifeq ($(shell command -v brew 2> /dev/null),)
	sudo true
	curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh | bash
endif
endif

install-mitamae: ## Install Mitamae
	./bin/setup install

mitamae: ## Mitamae
	bin/mitamae local lib/bootstrap.rb

brew: brew-upgrade brew-bundle ## Only Brew

brew-upgrade: ## Upgrade formula
	brew upgrade

brew-bundle: ## Bundle install
	./bin/mitamae local ./cookbooks/brew/default.rb

help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
