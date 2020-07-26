
.DEFAULT_GOAL := help


install: install-xcode install-brew install-mitamae ##

.PHONY:	install-xcode
install-xcode:
ifeq ($(shell xcode-select -p 2> /dev/null),)
	xcode-select --install
endif

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

.PHONY:	help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'