#!/usr/bin/env bash

set -e
cd "$(dirname ${BASH_SOURCE[0]})"

DIR="`pwd`"

if [ "`command -v bundle`" == "" ]; then
    echo 'Bundle not found, please install bundle using `gem install bundler`'
    exit 1 
fi    

bundle config set path "${DIR}/.rubydeps"
bundle install
