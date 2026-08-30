#!/bin/sh
set -eu

basename -s .rb -a Formula/*.rb | paste -sd, -
