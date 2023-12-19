#!/usr/bin/env bash

NERD_FONT_INSTALL_DIR=~/.local/share/fonts/NerdFonts
HACK_NERD_FONT_GITHUB=https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack

mkdir -p "${NERD_FONT_INSTALL_DIR}"

curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFont-Bold.ttf"            ${HACK_NERD_FONT_GITHUB}/Bold/HackNerdFont-Bold.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFontMono-Bold.ttf"        ${HACK_NERD_FONT_GITHUB}/Bold/HackNerdFontMono-Bold.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFontPropo-Bold.ttf"       ${HACK_NERD_FONT_GITHUB}/Bold/HackNerdFontPropo-Bold.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFont-BoldItalic.ttf"      ${HACK_NERD_FONT_GITHUB}/BoldItalic/HackNerdFont-BoldItalic.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFontMono-BoldItalic.ttf"  ${HACK_NERD_FONT_GITHUB}/BoldItalic/HackNerdFontMono-BoldItalic.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFontPropo-BoldItalic.ttf" ${HACK_NERD_FONT_GITHUB}/BoldItalic/HackNerdFontPropo-BoldItalic.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFont-Italic.ttf"          ${HACK_NERD_FONT_GITHUB}/Italic/HackNerdFont-Italic.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFontMono-Italic.ttf"      ${HACK_NERD_FONT_GITHUB}/Italic/HackNerdFontMono-Italic.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFontPropo-Italic.ttf"     ${HACK_NERD_FONT_GITHUB}/Italic/HackNerdFontPropo-Italic.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFontMono-Regular.ttf"     ${HACK_NERD_FONT_GITHUB}/Regular/HackNerdFontMono-Regular.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFontPropo-Regular.ttf"    ${HACK_NERD_FONT_GITHUB}/Regular/HackNerdFontPropo-Regular.ttf
curl -fLo "${NERD_FONT_INSTALL_DIR}/HackNerdFont-Regular.ttf"         ${HACK_NERD_FONT_GITHUB}/Regular/HackNerdFont-Regular.ttf

fc-cache -fv
