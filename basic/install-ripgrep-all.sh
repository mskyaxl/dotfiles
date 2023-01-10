
#!/usr/bin/env bash

RELEASE_URL=https://github.com/phiresky/ripgrep-all/releases

LATEST_VERSION=$(curl "${RELEASE_URL}" 2>/dev/null \
    | grep -Po 'ripgrep-all\/releases\/tag\/v\d+\.\d+\.\d+' | awk -F '/' '{print $NF}' | head -n 1 )

ARCHIVE_NAME="ripgrep_all-${LATEST_VERSION}-x86_64-unknown-linux-musl"

TAR_URL=${RELEASE_URL}/download/${LATEST_VERSION}/${ARCHIVE_NAME}.tar.gz

wget -q -O /tmp/tmp.tar.gz ${TAR_URL}  && \
     tar -C /tmp/ -xf /tmp/tmp.tar.gz ${ARCHIVE_NAME}/rga ${ARCHIVE_NAME}/rga-preproc &&
     mv /tmp/${ARCHIVE_NAME}/* ~/bin/ && rm /tmp/${ARCHIVE_NAME} -rf && rm /tmp/tmp.tar.gz
