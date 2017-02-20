#!/bin/sh
set -ex

# ensure we're up to date
git pull
# bump version
docker run --rm -v "$PWD":/app treeder/bump patch
version=`cat VERSION`
echo "version: $version"

git add -u
git commit -m "$version release [skip ci]"
git tag -f -a "$version" -m "version $version"
git push
git push --tags
