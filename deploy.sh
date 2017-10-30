#!/bin/bash

if [ -z "$TRAVIS_TAG" ]; then
    echo "Not a TAG, skip the update."
    exit 0
fi

git clone --quiet --branch=gh-pages https://cadasta:$API_KEY@github.com/cadasta/api-docs  /home/travis/build/cadasta/docs-branch

mkdir docs-build
npm run build

cp -rf docs-build/index.html /home/travis/build/cadasta/docs-branch
cp -rf docs-build/bundle.js /home/travis/build/cadasta/docs-branch
cp -rf css /home/travis/build/cadasta/docs-branch/css
cp -rf lib /home/travis/build/cadasta/docs-branch/lib

cd /home/travis/build/cadasta/docs-branch

git config --global user.name "m-murad"
git config --global user.email "murad.kuka@gmail.com"

git add .
git commit -m "Docs updated for $TRAVIS_TAG"
git push origin gh-pages --quiet
echo "Docs updated."
