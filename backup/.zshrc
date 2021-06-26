#! /usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Custom GOPATH
export GOPATH="${HOME}/Developer/go"

# Path for brew installed binary, go binary and krew plugins
export PATH="/usr/local/sbin:${PATH}:${GOPATH}/bin:${HOME}/.krew/bin"

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set default editor to vim
export EDITOR="vim"

# User configuration
export MANPATH="/usr/local/man:${MANPATH}"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export SCCACHE_CACHE_SIZE="50G"

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Disable bi-weekly auto-update checks.
typeset -g DISABLE_AUTO_UPDATE="true"

# Command execution time stamp shown in the history command output.
typeset -g HIST_STAMPS="yyyy-mm-dd"

# Which plugins would you like to load?
typeset -g plugins=(
  ansible
  docker
  git
  terraform
)

source "${ZSH}/oh-my-zsh.sh"

# Copy the main rsa key to clipboard
alias rsakey="cat ~/.ssh/id_rsa.pub | pbcopy && echo 'Copied id_rsa to clipboard'"

# Copy the main ed25519 key to clipboard
alias edkey="cat ~/.ssh/id_ed25519.pub | pbcopy && echo 'Copied is_ed25519 to clipboard'"

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

# Update all installed formulas and casks with brew
alias upgrade_brew='brew doctor && brew upgrade && brew cleanup -s --prune=0'

# IP addresses
alias publicip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"
alias ips="ifconfig -a | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{ sub(/inet6? (addr:)? ?/, \"\"); print }'"

# Kubernetes
alias k="kubectl"
alias kget="k get"
alias kyaml="kget -o yaml"
alias kwide="kget -o wide"
alias kdesc="k describe"
alias kapply="k apply -f"
alias kdel="k delete"
alias kdelf="k delete -f"
alias kexec="k exec -it"
alias kedit="k edit"
alias knew="k create"
alias kcp="k cp"
alias kevrything="k get all --all-namespaces"

# K8s Logs
alias klog="k logs -f"
alias kl10="klog --tail=10"

# K8s Pods
alias kgp="kget pods"
alias kgpyaml="kyaml pods"
alias kgpwide="kwide pods"
alias kpf="k port-forward"

# K8s Services
alias kgs="kget svc"
alias kgsyaml="kyaml svc"
alias kgswide="kwide svc"

# K8s Deployments
alias kgd="kget deploy"
alias kgdyaml="kyaml deploy"
alias kgdwide="kwide deploy"
alias kscale="k scale deploy"

# K8s ConfigMaps
alias kgcm="kget cm"
alias kgcmyaml="kyaml cm"

# K8s Secrets
alias kgsec="kget secrets"
alias kgsecyaml="kyaml secrets"

# K8s Nodes
alias kgn="kget nodes"
alias kdn="kdesc nodes"
