#!/usr/bin/env bash

cd "$(dirname "$0")"

./acerules-server.exe &
apache2ctl -D FOREGROUND
