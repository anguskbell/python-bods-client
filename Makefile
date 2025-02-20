SHELL:=/usr/bin/env bash


.PHONY: lint
lint:
	poetry run mypy bods_client tests/**/*.py
	poetry run flake8 bods_client tests
	poetry run doc8 -q docs

.PHONY: unit
unit:
	poetry run pytest tests/

.PHONY: package
package:
	poetry check
	poetry run pip check
	poetry run safety check --full-report

.PHONY: test
test: lint package unit
