#!/usr/bin/env bash

set -x
set -e

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"
git checkout ${TRAVIS_BRANCH}
git submodule update --remote --merge
if [[ `git status --porcelain` ]]; then
    git add .
    git commit -m "[skip ci] update submodules"
    git push https://${GITHUB_TOKEN}@github.com/pedh/pedh.github.io
fi
