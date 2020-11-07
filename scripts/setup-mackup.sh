#! /usr/bin/env sh

set -o nounset
set -o errexit

# Set the umask for readwrite only from the current user
umask 0077

printf "%sSetup Mackup to restore the dotfiles...\033[m\n" "$(/usr/bin/tput setaf 7)"
/usr/bin/sed "s|path_to_git_repository|${PWD}|g" "${PWD}/.mackup.cfg" > "${HOME}/.mackup.cfg"
/bin/cp -r "${PWD}/.mackup" "${HOME}/.mackup"

/usr/local/bin/mackup -f restore

if [ -f "${HOME}/.gitconfig.private" ]; then
  printf "%s.gitconfig.private file found, do not overwrite it!\033[m\n" "$(/usr/bin/tput setaf 7)"
  exit 0
fi

printf "%sCreating .gitconfig.private file with user information...\033[m\n" "$(/usr/bin/tput setaf 7)"
printf "%s  What is your Git user name?\n" "$(/usr/bin/tput setaf 7)"
read -r GIT_USER_NAME
printf "\r  What is your Git user email?\n"
read -r GIT_USER_EMAIL

/bin/cat << EOF > "${HOME}/.gitconfig.private"
[user]
  name = ${GIT_USER_NAME}
  email = ${GIT_USER_EMAIL}

EOF
