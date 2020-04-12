#!/bin/bash

docker run -it \
    --rm --name go \
    -w $PWD \
    -v $PWD:$PWD \
	yibuyiyin/go-iris go $@
