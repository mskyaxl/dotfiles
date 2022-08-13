#!/usr/bin/env bash

wget -q -O /tmp/tmp.zip https://forum.xda-developers.com/attachments/xperifirm-5-6-5-by-igor-eisberg-zip.5488139 \
  && unzip -o /tmp/tmp.zip -d ~/bin \
  && rm /tmp/tmp.zip

cert-sync /etc/ssl/certs/ca-certificates.crt
certmgr -ssl -m https://igoreisberg.com
certmgr -ssl -m https://software.sonymobile.com
