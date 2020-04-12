#!/bin/bash

docker run --rm -it \
	--env COLUMNS=`tput cols` \
	--env LINES=`tput lines` \
	--env LINES=`tput lines` \
	--env LANG=C.UTF-8 \
	mysql mysql --default-character-set "utf8" $@
