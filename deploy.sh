#!/bin/bash

if [ "$TRAVIS_PULL_REQUEST" != "false" -o "$TRAVIS_REPO_SLUG" != "m-murad/api-docs" ]; then
    echo "Just a PR."
    exit 0
fi