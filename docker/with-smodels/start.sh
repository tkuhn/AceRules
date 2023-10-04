#!/usr/bin/env bash

cd "$(dirname "$0")"

nohup ./acerules-server.exe &
apache2ctl -D FOREGROUND
