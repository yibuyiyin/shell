#!/bin/bash

set -e

set -- docker exec -i redis_server redis-cli $@

eval "$@"
