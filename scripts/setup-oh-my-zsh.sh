#! /usr/bin/env sh

set -o errexit

# Set the umask for readwrite only from the current user
umask 0077

OH_MY_ZSH_URL="https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh"
P10K_DIR="${HOME}/.oh-my-zsh/custom/themes/powerlevel10k"
if [ -d "${ZSH}" ]; then
  omz update
else
  printf "%sInstalling Oh My Zsh...%s\n" "$(/usr/bin/tput setaf 7)" "$(/usr/bin/tput sgr0)"
  /usr/bin/env sh -c "$(/usr/bin/curl -qfsSL "${OH_MY_ZSH_URL}")"  "" "--unattended"
fi

if [ -d "${P10K_DIR}" ]; then
  printf "%sUpdating Powerlevel10k custom theme...%s\n" "$(/usr/bin/tput setaf 7)" "$(/usr/bin/tput sgr0)"
  /usr/bin/git -C "${P10K_DIR}" fetch --depth 1
  /usr/bin/git -C "${P10K_DIR}" reset --hard origin/master
else
  ## Install my preferred theme
  printf "%sInstalling Powerlevel10k custom theme...%s\n" "$(/usr/bin/tput setaf 7)" "$(/usr/bin/tput sgr0)"
  /usr/bin/git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${P10K_DIR}"
fi
