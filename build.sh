#!/usr/bin/env bash

set -e
cd "$(dirname ${BASH_SOURCE[0]})"

# set root directory to the repository home
DIR="`pwd`"

# ======================= Checkers =======================
# check if bundle is installed
if [ "`command -v bundle`" == "" ]; then
    echo 'Bundle not found, please install bundle using `gem install --user-install bundler`'
    echo 'and add "USER INSTALLATION DIRECTORY" to your PATH' 
    exit 1 
fi

# check if Gemfile exist
if [ $# -eq 0 ]; then
    echo "please specify jekyll compile path."
    exit 1
else
    DOC_PATH=$1
    if [[ -f "${DIR}/${DOC_PATH}/Gemfile" ]]; then
        DOC_DIR=${DIR}/${DOC_PATH}
	echo "Found Gemfile in: ${DOC_DIR}"
    else
        echo "Gemfile not found: ${DIR}/${DOC_PATH}/Gemfile"
	exit 1
    fi
fi

# ======================= Build =======================
cd "${DOC_DIR}"

# install Ruby dependencies locally based on Gemfile
bundle config set path ".rubydeps"
bundle install --full-index 

# build doc
DOC_SRC=${DOC_DIR}
DOC_DST=${DOC_DIR}/content

JEKYLL_CMD="build"

if [ $# -eq 2 ]; then
    JEKYLL_CMD="serve --baseurl= --watch --trace --future --future"
fi

echo "${JEKYLL_CMD}"
# use 'bundle exec' to insert the local Ruby dependencies
bundle exec jekyll ${JEKYLL_CMD} --source "${DOC_SRC}" --destination "${DOC_DST}"

