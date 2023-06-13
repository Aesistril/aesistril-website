#!/bin/bash

# Delete and create ./build/
rm -rf ./build
mkdir ./build
mkdir ./build/temp

# Copy static files
cp -r ./files ./build
cp -r ./template/css ./build

# mustache ./content/base.yaml ./content/index.yaml 
# mustache ./test.yaml ./template/base.mustache > ./build/index.html
mustache ./content/base.yaml ./content/index.yaml | mustache - ./template/base.mustache > ./build/index.html

# Cleanup
rm -rf ./build/temp
