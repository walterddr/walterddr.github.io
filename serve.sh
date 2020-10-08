#!/usr/bin/env bash


set -e
cd "$(dirname ${BASH_SOURCE[0]})"

DIR="`pwd`"

DOCS_SRC=${DIR}/docs
bundle exec jekyll serve --source "${DOCS_SRC}"
