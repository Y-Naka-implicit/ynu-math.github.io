#!/bin/bash

# only proceed script when started not by pull request (PR)
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
  echo "this is PR, exiting"
  exit 0
fi
echo "r1"
# enable error reporting to the console
set -e
echo "r2"
# build site with jekyll, by default to `_site' folder
jekyll build
echo "r3"
# cleanup
rm -rf ../shiba.dog.leo/ynu-math.github.io.master
echo "r4"
#clone `master' branch of the repository using encrypted GH_TOKEN for authentification
git clone https://${GH_TOKEN}@github.com/shiba.dog.leo/ynu-math.github.io.git ../shiba.dog.leo/ynu-math.github.io.master
echo "r5"
# copy generated HTML site to `master' branch
cp -R _site/* ../shiba.dog.leo/ynu-math.github.io.master
echo "r6"
# commit and push generated content to `master' branch
# since repository was cloned in write mode with token auth - we can push there
cd ../shiba.dog.leo/ynu-math.github.io.master
git config --local user.name "Makoto Fukuda"
git config --local user.email "shiba.dog.leo.private@gmail.com"
git add -A .
git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1

