# JGiola Dotfiles

**These are my dotfiles. There are many like them, but these are mine.**

The repository contains all the dotfile configurations, install scripts and
system settings the way I like it. It is based on macOS, homebrew and zsh
with Oh My Zsh.

## Dependencies

Before going further you must known that for this repository to work as
intended you must have installed at least `cURL` and have launched this
command on macOS:

```sh
xcode-select --install
```

Or if you are on Linux:

```sh
# for Debian/Ubuntu distribution
sudo apt-get install build-essential procps curl file git

# for Fedora, CentOS or RHEL distribution
sudo dnf groupinstall 'Development Tools'
sudo dnf install procps-ng curl file git
sudo dnf install libxcrypt-compat # needed by Fedora 30 and up
```

## Installation

First be sure that, on macOS Mojave and up, your terminal has been granted
the Full Disk Access privilege:

- go to System Preferences -> Security & Privacy -> Privacy
- unlock the preferences
- select Full Disk Access
- tap on the + button and select the Terminal.app

After the Terminal app has the right privileges run the following command
in your terminal:

```sh
make setup
```

At the end of the script open a new terminal window to see the effects.

### Thanks

All the files present here has been somewhat inspired and or modified mainly from
these projects:

- [https://dotfiles.github.io](https://dotfiles.github.io)
- [https://github.com/DanToml/Dotfiles](https://github.com/DanToml/Dotfiles)
- [https://github.com/holman/dotfiles](https://github.com/holman/dotfiles)
- [https://github.com/mathiasbynens/dotfiles](https://github.com/mathiasbynens/dotfiles)
- [https://github.com/peterhajas/dotfiles](https://github.com/peterhajas/dotfiles)
