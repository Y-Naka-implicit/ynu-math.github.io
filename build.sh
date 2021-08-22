#!/bin/bash
echo "r1" >&2
# only proceed script when started not by pull request (PR)
if [ $TRAVIS_PULL_REQUEST == "true" ]; then
  echo "this is PR, exiting"
  exit 0
fi
echo "r2" >&2
# enable error reporting to the console
set -e
echo "r3" >&2
# build site with jekyll, by default to `_site' folder
jekyll build
echo "r4" >&2
# cleanup
rm -rf ../shiba.dog.leo/ynu-math.github.io.master
echo "r5" >&2
#clone `master' branch of the repository using encrypted GH_TOKEN for authentification
git clone https://${GH_TOKEN}@github.com/shiba.dog.leo/ynu-math.github.io.git ../shiba.dog.leo/ynu-math.github.io.master
echo "r6" >&2
# copy generated HTML site to `master' branch
cp -R _site/* ../shiba.dog.leo/ynu-math.github.io.master
echo "r7" >&2
# commit and push generated content to `master' branch
# since repository was cloned in write mode with token auth - we can push there
cd ../shiba.dog.leo/ynu-math.github.io.master
#git config --local user.name "Makoto Fukuda"
#git config --local user.email "shiba.dog.leo.private@gmail.com"
#git add -A .
#git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
#git push --force --quiet "https://${GH_TOKEN}@${GH_REF}" master:gh-pages > /dev/null 2>&1
echo "r8" >&2
