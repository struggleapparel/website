#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"

msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

rm -rf public
git submodule add -b master --force git@github.com:struggleapparel/struggleapparel.github.io.git public
cd public
git pull
shopt -s extglob
rm -rf !(".git")
cd ..

hugo

cd public
git add -A
git commit -m "$msg"
git push origin master

cd ..
git add -A
git commit -m "$msg"
git push origin master