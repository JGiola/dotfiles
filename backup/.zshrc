#! /usr/bin/env zsh

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Custom GOPATH
export GOPATH="${HOME}/Codes/go"

# Path for brew installed binary and go binary
export PATH="/usr/local/sbin:${PATH}:${GOPATH}/bin"

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set default editor to vim
export EDITOR="vim"

# User configuration
export MANPATH="/usr/local/man:${MANPATH}"

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Set name of the theme to load
ZSH_THEME="powerlevel10k/powerlevel10k"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Disable bi-weekly auto-update checks.
typeset -g DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to enable command auto-correction.
typeset -g ENABLE_CORRECTION="true"

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
alias kgpyaml="kget pods -o yaml"
alias kgpwide="kget pods -o wide"
alias kpf="k port-forward"

# K8s Services
alias kgs="kget svc"
alias kgsyaml="kget svc -o yaml"
alias kgswide="kget svc -o wide"

# K8s Deployments
alias kgd="kget deploy"
alias kgdyaml="kget deploy -o yaml"
alias kgdwide="kget deploy -o wide"
alias kscale="k scale deploy"

# K8s ConfigMaps
alias kgcm="kget cm"
alias kgcmyaml="kget cm -o yaml"

# K8s Secrets
alias kgsec="kget secrets"
alias kgsecyaml="kget secrets -o yaml"

# K8s Nodes
alias kgn="kget nodes"
alias kdn="kdesc nodes"
alias kresources="kdesc nodes | fgrep 'Allocated resources:' -A6"
