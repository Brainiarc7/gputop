#!/bin/bash

mkdir deploy
cd deploy
git config --global user.email "Travis@travis.org"
git config --global user.name "Travis CI"
git clone --quiet https://${GITHUB_TOKEN}@github.com/gputop/gputop.github.io.git
cd gputop.github.io
git checkout -b adrian_travis_test
rm -rf *
cp -r $TRAVIS_BUILD_DIR/install/share/remote/* .
git add --all
git status
git commit -m "Deployed by Travis"
git log
git push --force --quiet origin adrian_travis_test
