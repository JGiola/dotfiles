FROM docker.io/library/debian:trixie

RUN DEBIAN_FRONTEND=noninteractive apt-get update \
	&& apt-get install --yes --no-install-recommends \
	git \
	locales \
	sudo

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen \
	&& locale-gen en_US.UTF-8 \
	&& update-locale LANG=en_US.UTF-8

RUN groupadd --gid 1000 devcontainer \
	&& useradd -s /bin/bash --uid 1000 --gid devcontainer -m devcontainer \
	&& echo devcontainer ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/devcontainer \
	&& chmod 0440 /etc/sudoers.d/devcontainer
