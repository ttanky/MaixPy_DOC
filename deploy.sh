#!/bin/bash

set -o errexit -o nounset

rev=$(git rev-parse --short HEAD)

cd build

git init

git config user.name $GIT_NAME

git config user.email $GIT_EMAIL

git remote add upstream "https://$GITHUB_TOKEN@github.com/sipeed/MaixPy_DOC.git"

# comment below because we don't need history of gh-pages, and use git push --force to cover history
# git fetch upstream

# git reset upstream/gh-pages

# echo "gprs.ai-thinker.com" > CNAME

git add -A

git commit -m "rebuild pages at ${rev}"

git push upstream HEAD:gh-pages --force

