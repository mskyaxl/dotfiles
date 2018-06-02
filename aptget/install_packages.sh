#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

${BASEDIR}/install -p ${BASEDIR}/aptget/dotbot_plugin_aptget/aptget.py -c ${BASEDIR}/aptget/packages.conf.yaml
