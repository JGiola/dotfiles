#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

# shellcheck disable=SC2154
if [ -d "${xdg_data_home}/krew" ]; then
		echo "krew is already installed"
		exit 0
fi

TEMP_DIR=$(mktemp -d)

OS="$(uname | tr '[:upper:]' '[:lower:]')"
ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')"
KREW="krew-${OS}_${ARCH}"

curl -fsSL --proto '=https' --tlsv1.2 "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" -o "${TEMP_DIR}/${KREW}.tar.gz" 2> /dev/null

tar -zxf "${TEMP_DIR}/${KREW}.tar.gz" -C "${TEMP_DIR}" 2> /dev/null
# shellcheck disable=SC2154
KREW_ROOT="${xdg_data_home}/krew" "${TEMP_DIR}/${KREW}" install krew

rm -fr "${TEMP_DIR}"
