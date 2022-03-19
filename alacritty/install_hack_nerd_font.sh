#!/usr/bin/env bash

NERD_FONT_INSTALL_DIR=~/.local/share/fonts/NerdFonts
HACK_NERD_FONT_GITHUB=https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack

mkdir -p 

curl -fLo "${NERD_FONT_INSTALL_DIR}/Hack Regular Nerd Font Complete Mono.ttf"     ${HACK_NERD_FONT_GITHUB}/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/Hack Regular Nerd Font Complete.ttf"          ${HACK_NERD_FONT_GITHUB}/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete%20Mono.ttf  
curl -fLo "${NERD_FONT_INSTALL_DIR}/Hack Bold Nerd Font Complete Mono.ttf"        ${HACK_NERD_FONT_GITHUB}/Bold/complete/Hack%20Bold%20Nerd%20Font%20Complete.ttf  
curl -fLo "${NERD_FONT_INSTALL_DIR}/Hack Bold Nerd Font Complete.ttf"             ${HACK_NERD_FONT_GITHUB}/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/Hack Italic Nerd Font Complete.ttf"           ${HACK_NERD_FONT_GITHUB}/Italic/complete/Hack%20Italic%20Nerd%20Font%20Complete%20Mono.ttf 
curl -fLo "${NERD_FONT_INSTALL_DIR}/Hack Italic Nerd Font Complete Mono.ttf"      ${HACK_NERD_FONT_GITHUB}/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/Hack Bold Italic Nerd Font Complete Mono.ttf" ${HACK_NERD_FONT_GITHUB}/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/Hack Bold Italic Nerd Font Complete.ttf"      ${HACK_NERD_FONT_GITHUB}/BoldItalic/complete/Hack%20Bold%20Italic%20Nerd%20Font%20Complete.ttf     

fc-cache -fv
