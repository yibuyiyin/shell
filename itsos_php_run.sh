#!/bin/bash

docker run -it \
    --rm --name php \
    -w $PWD \
    -v $PWD:$PWD \
	yibuyiyin/php-fpm php $@
