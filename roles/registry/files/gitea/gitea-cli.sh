#!/bin/sh
USER=git HOME=/home/gitea GITEA_WORK_DIR=/var/lib/gitea sudo -E -u git gitea --config /data/gitea/conf/app.ini "$@"