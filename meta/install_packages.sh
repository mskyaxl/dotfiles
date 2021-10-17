#!/usr/bin/env bash

set -e

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

META_DIR="meta"
CONFIG_DIR="configs"
PROFILES_DIR="profiles"

DOTBOT_DIR="dotbot"
DOTBOT_BIN="bin/dotbot"

echo "${BASEDIR}/${META_DIR}/${DOTBOT_DIR}/${DOTBOT_BIN}"

sudo "${BASEDIR}/${META_DIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" -p "${BASEDIR}/${META_DIR}/dotbot_plugin_aptget/aptget.py" -c "${BASEDIR}/$1/apt-package.yaml"
# sudo -K

