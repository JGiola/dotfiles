#! /usr/bin/env sh

# IP addresses
alias publicip='dig +short myip.opendns.com @resolver1.opendns.com'
# shellcheck disable=SC2142
alias localip="ip -o -4 addr list eth0 | awk '{print \$4}' | cut -d/ -f1"
# shellcheck disable=SC2142
alias ips="ip -o address | grep -o 'inet6\? \(addr:\)\?\s\?\(\(\([0-9]\+\.\)\{3\}[0-9]\+\)\|[a-fA-F0-9:]\+\)' | awk '{print \$2}'"

# recursively delete all .DS_Store files in the current directory, useful on macOS
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Human-readable disk usage.
alias dfh="df -Tha --total"

# Kubernetes aliases
alias k="kubectl"
alias kexec="kubectl exec -it"
alias klogs="kubectl logs -f"
alias kdesc="kubectl describe"
alias kapply="kubectl apply -f"
alias kdel="kubectl delete"

alias kgp="kubectl get pods"
alias kgs="kubectl get services"
alias kgd="kubectl get deployments"
alias kgn="kubectl get nodes"
alias kgcm="kubectl get configmaps"
alias kgsec="kubectl get secrets"

alias kyaml="kubectl get -o yaml"
alias kjson="kubectl get -o json"
