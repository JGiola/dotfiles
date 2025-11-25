# Dotfiles

This repository contains my dotfiles. I’m trying to keep them well organized and to try to put all
the configurations states and caches following the [XDG Base Directory Specification].

For now is set for working ok inside a Debian WSL2 container and on a macOS machine, maybe in the
future it will be updated for other machines...

## How To

For installing the dotfiles you have to clone it locally and then run the [`install` script].
The script will in turn do these things:

- install main tools and libraries with `atp` on debian or `brew` on macOS
- on macOS setup some application defaults to my liking
- creating basic folders for the XDG specification
- setup oh-my-zsh for the shell
- setup the configurations in the user home folder and cleaning old shell files
- install and setup some tools with [`mise`]
- install and setup plugins with [`krew`]

[XDG Base Directory Specification]: https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html
[`install` script]: /install
[`mise`]: http://mise.jdx.dev/ "The front-end to your dev env"
[`krew`]: https://krew.sigs.k8s.io " kubectl plugin manager"
