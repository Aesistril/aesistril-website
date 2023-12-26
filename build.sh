#!/bin/bash

printf "Copying static files... "
# Delete and create ./build/
rm -rf ./build
mkdir ./build
mkdir ./build/blog
mkdir ./build/blog/devlog
mkdir ./build/blog/thoughts
mkdir ./build/blog/technology
mkdir ./build/terry-tribute
mkdir ./build/terry-tribute-absolute

# Copy static files
cp -r ./files ./build
mv ./build/files/images/base/favicon.ico ./build/
cp -r ./template/css ./build
printf "DONE!"

printf "\nBuilding pages with mustache... "
mustache ./content/extensions.yaml/base.yaml ./content/index.yaml | mustache - ./template/base.mustache > ./build/index.html
mustache ./content/extensions.yaml/base.yaml ./content/404.yaml | mustache - ./template/404.mustache > ./build/404.html

# Blog
mustache ./content/extensions.yaml/base.yaml ./content/blog/index.yaml | mustache - ./template/blog/index.mustache > ./build/blog/index.html
mustache ./content/extensions.yaml/base.yaml ./content/blog/devlog/index.yaml | mustache - ./template/blog/index.mustache > ./build/blog/devlog/index.html
mustache ./content/extensions.yaml/base.yaml ./content/blog/thoughts/index.yaml | mustache - ./template/blog/index.mustache > ./build/blog/thoughts/index.html
mustache ./content/extensions.yaml/base.yaml ./content/blog/thoughts/ancestral-authority.yaml | mustache - ./template/base.mustache > ./build/blog/thoughts/ancestral-authority.html
mustache ./content/extensions.yaml/base.yaml ./content/blog/devlog/curatedcrawl-alpha.yaml | mustache - ./template/base.mustache > ./build/blog/devlog/curatedcrawl-alpha.html
mustache ./content/extensions.yaml/base.yaml ./content/blog/technology/firefox-ext.yaml | mustache - ./template/base.mustache > ./build/blog/technology/firefox-ext.html

# Terry Tribute (WIP)
mustache ./content/extensions.yaml/base.yaml ./content/terry-tribute/index.yaml | mustache - ./template/terry-tribute.mustache > ./build/terry-tribute/index.html
mustache ./content/extensions.yaml/base.yaml ./content/terry-tribute-absolute/index.yaml | mustache - ./template/terry-tribute-absolute.mustache > ./build/terry-tribute-absolute/index.html
printf "DONE!"
printf "\nBuild Completed!\n"
