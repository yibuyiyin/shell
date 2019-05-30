#!/bin/bash

set -e

set -- docker exec -it redis_server redis-cli $@

exec "$@"
