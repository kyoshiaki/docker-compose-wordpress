#!/bin/sh

#
# 2021/08/16(Mon) 21:00:47
#
# コマンドは、下記 Help 参照。
# docker-compose --help
#
# Options:
#  -d flag (for “detached” mode)
#
# Commands:
#  up                 Create and start containers
#  restart            Restart services
#  start              Start services
#  stop               Stop services
#  down               Stop and remove containers, networks, images, and volumes
#

echo "docker-compose up -d"
docker-compose up -d
