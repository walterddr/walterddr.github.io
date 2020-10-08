#!/usr/bin/env bash

set -e
cd "$(dirname ${BASH_SOURCE[0]})"

DIR="`pwd`"

if [ "`command -v bundle`" == "" ]; then
	echo "Installing bundle locally"
	
	if which ruby >/dev/null && which gem >/dev/null; then
		export PATH="$(ruby -rubygems -e 'puts Gem.user_dir')/bin:$PATH"
	fi
	# install bundle locally
	gem install --user-install bundler	
fi	

bundle install --path .rubydeps
