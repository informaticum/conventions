#!/usr/bin/make -f

.DEFAULT_GOAL := build
.PHONY: help fetch rebase push send log clean scan build doc install

# https://www.thapaliya.com/en/writings/well-documented-makefiles/
help: ## Shows this help including list of targets
	awk 'BEGIN {FS = ":.*##"; printf "Usage: make \033[36m<target>\033[0m\n\nTargets:\n"} /^[a-zA-Z0-9_-]+:.*?##/ { printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2 }' $(MAKEFILE_LIST)

fetch: ## Fetches git database
	git fetch --all --tags --prune --verbose --progress

rebase: ## Pulls all missing commits for current git branch
	git pull --rebase --autostash --verbose

push: ## Pushes current git branch incl. git tags
	git push --follow-tags

send: fetch rebase push ## Executes target 'fetch', 'rebase', and 'push'

log: ## Pushes current git branch incl. git tags
	git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --all

clean: ## Runs maven clean
	mvn -o clean

scan: ## Scans for plugin/property updates
	mvn -U versions:display-parent-updates versions:display-plugin-updates versions:display-dependency-updates versions:display-property-updates

build: ## Runs maven build (no install, no deploy)
	mvn -U clean verify

doc: ## Runs maven build incl. site goal (no install, no deploy)
	mvn -U clean verify site

install: ## Runs maven install (into local .m2 folder) (no deploy)
	mvn clean install
