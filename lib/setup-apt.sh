#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

# shellcheck source=/dev/null
. "/etc/os-release"

username="$(whoami)"

sudo DEBIAN_FRONTEND=noninteractive apt-get update --quiet=2
sudo DEBIAN_FRONTEND=noninteractive apt-get install --quiet=2 --no-install-recommends \
	apt-transport-https \
	apt-utils \
	ca-certificates \
	curl \
	dnsutils \
	fzf \
	git \
	git-lfs \
	gnupg2 \
	gzip \
	iproute2 \
	iptables \
	jq \
	kubectx \
	less \
	locales \
	man-db \
	netcat-openbsd \
	rsync \
	shellcheck \
	tar \
	tmux \
	unzip \
	usbutils \
	vim \
	wget \
	xz-utils \
	yubikey-manager \
	zsh

# Swap to legacy iptables for compatibility
if type iptables-legacy > /dev/null 2>&1; then
	sudo DEBIAN_FRONTEND=noninteractive update-alternatives --set iptables "/usr/sbin/iptables-legacy"
	sudo DEBIAN_FRONTEND=noninteractive update-alternatives --set ip6tables "/usr/sbin/ip6tables-legacy"
fi

sudo install -m 0755 -d "/etc/apt/keyrings"
curl -fsSL --proto '=https' --tlsv1.2 "https://download.docker.com/linux/${ID}/gpg" 2> /dev/null | gpg --dearmor | sudo tee "/etc/apt/keyrings/docker-apt-keyring.gpg" > /dev/null

sudo tee "/etc/apt/sources.list.d/docker.sources" > /dev/null << EOF
Types: deb
URIs: https://download.docker.com/linux/${ID}
Suites: ${VERSION_CODENAME}
Components: stable
Signed-By: /etc/apt/keyrings/docker-apt-keyring.gpg
Arch: $(dpkg --print-architecture)
EOF

curl -fsSL --proto '=https' --tlsv1.2 "https://mise.jdx.dev/gpg-key.pub" 2> /dev/null | gpg --dearmor | sudo tee /etc/apt/keyrings/mise-apt-keyring.gpg > /dev/null
sudo tee "/etc/apt/sources.list.d/mise.sources" > /dev/null << EOF
Types: deb
URIs: https://mise.jdx.dev/deb
Suites: stable
Components: main
Signed-By: /etc/apt/keyrings/mise-apt-keyring.gpg
EOF

sudo DEBIAN_FRONTEND=noninteractive apt-get update  --quiet=2
sudo DEBIAN_FRONTEND=noninteractive apt-get install  --quiet=2 --no-install-recommends \
	mise \
	docker-ce-cli \
	docker-ce \
	docker-compose-plugin \
	docker-buildx-plugin

sudo DEBIAN_FRONTEND=noninteractive apt-get autoremove --quiet=2
sudo DEBIAN_FRONTEND=noninteractive apt-get clean --quiet=2

sudo usermod -aG docker "${username}"

# create directory for additional docker cli plugins
sudo mkdir -p "/usr/local/libexec/docker/cli-plugins"

# Limit log size
sudo tee "/etc/docker/daemon.json" > /dev/null << EOF
{
	"log-driver": "json-file",
	"log-opts": {
		"max-size": "10m",
		"max-file": "5"
	}
}
EOF

# Run apt update and upgrade without sudo password prompt
sudo tee "/etc/sudoers.d/apt-update" > /dev/null << EOF
%sudo ALL=(root) NOPASSWD: /usr/bin/apt update, /usr/bin/apt * update, /usr/bin/apt update *
%sudo ALL=(root) NOPASSWD: /usr/bin/apt upgrade, /usr/bin/apt * upgrade, /usr/bin/apt upgrade *
EOF

docker completion zsh | sudo tee "/usr/local/share/zsh/site-functions/_docker" > /dev/null
mise completion zsh | sudo tee "/usr/local/share/zsh/site-functions/_mise" > /dev/null
_YKMAN_COMPLETE=zsh_source ykman | sudo tee /usr/local/share/zsh/site-functions/_ykman > /dev/null
