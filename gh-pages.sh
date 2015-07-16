#!/bin/sh
BRANCH=gh-pages
FOLDER=$BRANCH

echo "Clone down self, clean 'er up."
git clone -q git@github.com:mglaman/deconstructing-drupal-commerce.git --branch $BRANCH --single-branch $FOLDER
cd $FOLDER
git rm -rf . > /dev/null

echo "Copy files"
cp -r ../assets ./
cp -r ../css ./
cp -r ../images ./
cp -r ../js ./
cp -r ../lib ./
cp -r ../plugin ./
cp -r ../index.html ./

echo "Commit and publish!"
git add .
git commit -m "Published slides." > /dev/null
git push origin $BRANCH -q

cd ..
rm -rf $FOLDER
