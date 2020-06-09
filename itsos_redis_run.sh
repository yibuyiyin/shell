#!/bin/bash

set -e

set -- docker run -it --rm --name redis redis redis-cli $@

eval "$@"
