#!/usr/bin/env bash

wget -q -O /tmp/tmp.zip https://forum.xda-developers.com/attachments/unsin-1-13-linux-x64-zip.5150007/ \
  && unzip -o /tmp/tmp.zip -d ~/bin \
  && rm /tmp/tmp.zip \
  && chmod +x ~/bin/unsin
