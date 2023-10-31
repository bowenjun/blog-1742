#!/bin/bash

yum install golang

HUGO_VERSION="0.120.1"

curl -Lo hugo.tar.gz "https://github.com/gohugoio/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_Linux-64bit.tar.gz"

tar -xvf hugo.tar.gz -C /usr/local/bin/

hugo version

hugo mod tidy