#!/usr/bin/env bash

function get_distro() {
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        echo $ID
    else
        uname
    fi
}

function install() {
    META_DIR="meta"

    DOTBOT_DIR="dotbot"
    DOTBOT_BIN="bin/dotbot"

    BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    IF_PLATFORM_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot-ifplatform/ifplatform.py"
    SUDO_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot-sudo/sudo.py"
    RUST_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot-rust/rust.py"
    INCLUDE_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot-include/include.py"
    CONDITIONAL_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot-conditional/conditional.py"


    local distro=$(get_distro)
    # Perform actions based on the detected distribution
    case $distro in
        ubuntu|pop)
           echo "You are using Ubuntu or Debian."
           # Add commands specific to Ubuntu/Debian here
           PACKAGE_MANAGER_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot_aptget/aptget.py"
           ;;
        arch)
            echo "You are using Arch Linux."
            PACKAGE_MANAGER_PLUGIN="${BASE_DIR}/${META_DIR}/dotbot_plugins/dotbot-paru/paru.py"
            ;;
        *)
            echo "Unknown or unsupported distribution: $distro"
            ;;
    esac

    set -e

    cd "${BASE_DIR}"

    for config in ${@}; do
        cmd=("${BASE_DIR}/${META_DIR}/${DOTBOT_DIR}/${DOTBOT_BIN}" \
             -d "${BASE_DIR}" \
             -p "${IF_PLATFORM_PLUGIN}" \
             -p "${PACKAGE_MANAGER_PLUGIN}" \
             -p "${SUDO_PLUGIN}" \
             -p "${RUST_PLUGIN}" \
             -p "${INCLUDE_PLUGIN}" \
             -p "${CONDITIONAL_PLUGIN}" \
             -c "$config" -vv)
        "${cmd[@]}"
    done

    echo "Restart your terminal..."
}

install ${@}
