#!/bin/sh

image="testing_neovim:fedora" 

docker build -t $image .

docker run --rm -it $image
