#!/usr/bin/env bash

set -e

META_DIR="meta"

DOTBOT_DIR="dotbot"
DOTBOT_BIN="bin/dotbot"

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

APT_GET_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot_plugin_aptget/aptget.py"
SUDO_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot-sudo/sudo.py"
RUST_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot-rust/rust.py"
INCLUDE_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot-include/include.py"
CONDITIONAL_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot-conditional/conditional.py"


cd "${BASE_DIR}"

for config in ${@}; do
    cmd=("${BASE_DIR}/${META_DIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" \
         -d "${BASE_DIR}" \
         -p "${APT_GET_PLUGIN}" \
         -p "${SUDO_PLUGIN}" \
         -p "${RUST_PLUGIN}" \
         -p "${INCLUDE_PLUGIN}" \
         -p "${CONDITIONAL_PLUGIN}" \
         -c "$config")
    "${cmd[@]}"
done

echo "Restart your terminal..."

