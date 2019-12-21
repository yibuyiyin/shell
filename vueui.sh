#!/bin/bash
set -e

nohup vue ui -H 0 -p 8081 >> /tmp/vue.ui.log 2>&1 &
