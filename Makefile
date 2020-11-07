.PHONY: setup omz homebrew macos-config mackup-restore vscode-restore mackup-backup homebrew-backup vscode-backup

setup: omz homebrew macos-config mackup-restore vscode-restore

omz:
	./scripts/setup-oh-my-zsh.sh

homebrew:
	./scripts/setup-homebrew.sh

macos-config:
	./scripts/setup-macos-settings.sh

mackup-restore:
	./scripts/setup-mackup.sh

vscode-restore:
	cat ./vscode.extlist | xargs -L1 code --install-extension

mackup-backup:
	mackup backup

homebrew-backup:
	brew bundle dump --force

vscode-backup:
	code --list-extensions > vscode.extlist
