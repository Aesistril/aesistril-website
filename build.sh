#!/bin/bash

printf "Copying static files... "
# Delete and create ./build/
rm -rf ./build
mkdir ./build
mkdir ./build/blog

# Copy static files
cp -r ./files ./build
cp -r ./template/css ./build
printf "DONE!"

printf "\nBuilding pages with mustache... "
mustache ./content/extensions.yaml/base.yaml ./content/index.yaml | mustache - ./template/base.mustache > ./build/index.html
mustache ./content/extensions.yaml/base.yaml ./content/blog/index.yaml | mustache - ./template/blog/index.mustache > ./build/blog/index.html
printf "DONE!"
printf "\nBuild Completed!\n"
