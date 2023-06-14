#!/bin/bash

printf "Copying static files... "
# Delete and create ./build/
rm -rf ./build
mkdir ./build

# Copy static files
cp -r ./files ./build
cp -r ./template/css ./build
printf "DONE!"

printf "\nBuilding pages with mustache... "
mustache ./content/base.yaml ./content/index.yaml | mustache - ./template/base.mustache > ./build/index.html
printf "DONE!"
printf "\nBuild Completed!\n"
