#!/usr/bin/env bash

set -eux

git clone https://github.com/soenkehahn/agora
(cd agora; git checkout 0.0.1)
docker build .
