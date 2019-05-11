#!/bin/bash

eval "docker exec -i mysql mysql \
	--default-character-set \"utf8\" $@"
