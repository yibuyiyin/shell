#!/bin/bash

docker exec -it rabbitmq_server rabbitmqctl "$@"
