#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user and read for anyone else
umask 0022

mise install -C "${HOME}"

COMPLETION_PREFIX="/usr/local"
if /usr/bin/command -v brew > /dev/null 2>&1; then
	COMPLETION_PREFIX="$(brew --prefix)"
fi

mise exec kubectl -- kubectl completion zsh | sudo tee "${COMPLETION_PREFIX}/share/zsh/site-functions/_kubectl" > /dev/null
mise exec kind -- kind completion zsh | sudo tee "${COMPLETION_PREFIX}/share/zsh/site-functions/_kind" > /dev/null
mise exec k9s -- k9s completion zsh | sudo tee "${COMPLETION_PREFIX}/share/zsh/site-functions/_k9s" > /dev/null
mise exec oras -- oras completion zsh | sudo tee "${COMPLETION_PREFIX}/share/zsh/site-functions/_oras" > /dev/null
mise exec yq -- yq completion zsh | sudo tee "${COMPLETION_PREFIX}/share/zsh/site-functions/_yq" > /dev/null
mise exec yq -- golangci-lint completion zsh | sudo tee "${COMPLETION_PREFIX}/share/zsh/site-functions/_golangci-lint" > /dev/null
