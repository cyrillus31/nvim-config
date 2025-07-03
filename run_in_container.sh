#!/bin/sh

image="testing_neovim:fedora" 

docker build -t $image .

docker run -it $image
