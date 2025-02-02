#!/usr/bin/env bash

rm ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc

rm ~/.bash_aliases
ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases

rm ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

rm ~/.get_network_device
ln -s ~/.dotfiles/get_network_device ~/.get_network_device

## Move old configuration file but don't rmrf
if [ -d ~/.config/nvim ]; then
	mv ~/.config/nvim ~/.config/_nvim_old
fi
ln -s ~/.dotfiles/nvim ~/.config/

#Installs
echo 'apt-get update'
sudo apt-get update

## git
echo 'Installing git' sudo apt -y install git

## curl
echo "Installing curl" sudo apt install curl

## wezterm
# echo 'Installing wezterm'
# curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
# echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
# sudo apt update
# sudo apt -y install wezterm


## Git Kraken
# if test -f /usr/bin/gitkraken
# then
# 	echo 'Gitkraken already installed'
# else
# 	echo 'Fetching Gitkraken'
# 	curl -LO https://release.gitkraken.com/linux/gitkraken-amd64.deb
# 	echo 'Installing Gitkraken'
# 	sudo dpkg -i gitkraken-amd64.deb
# 	sudo rm gitkraken-amd64.deb
# fi

## Neovim
if [ -d /opt/nvim-linux64 ]; then
	echo 'Neovim already installed'
else
	echo 'Fetching nvim'
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	echo 'Installing nvim'
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
	echo 'Cleaning up'
	rm nvim-linux64.tar.gz
fi

## Obsidian
# if [ -f /usr/bin/obsidian ]; then
# 	echo 'Obsidian already installed'
# else
# 	echo 'Fetching obsidian'
# 	curl -LO https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.11/obsidian_1.5.11_amd64.deb
# 	echo 'Installing obsidian'
# 	sudo dpkg -i obsidian_1.5.11_amd64.deb
# 	echo 'Cleaning up'
# 	rm obsidian_1.5.11_amd64.deb
# fi

## nvm
if [ -d /home/michael/.nvm ]; then
	echo 'nvm already installed'
else
	echo 'Installing nvm'
	## @todo: pin this version check somehow
	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
	export NVM_DIR="$HOME/.nvm"
	[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
	[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
	nvm install 18
fi

## node
# @todo pin this version check somehow
if [ -d /home/michael/.nvm/versions/node/v18.19.1 ]; then
	echo 'node already installed'
else
	echo 'Installing node'
	nvm install 18
fi


## xclip
## Used for copying to clipboard from nvim
if [ -f /usr/bin/xclip ]; then
	echo 'xclip already installed'
else
	sudo apt -y install xclip
fi

## Install python
sudo apt install -y python3
sudo apt install -y python3-venv
sudo apt install -y python3-pip

## Install dotnet
# curl -LO https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb
# sudo dpkg -i packages-microsoft-prod.deb
# rm packages-microsoft-prod.deb
# sudo apt-get update
# sudo apt-get install -y dotnet-sdk-8.0

# Install Rust
if [ -d ~/.cargo ]; then
	echo 'Rust already installed'
else
	curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
fi

# Fuzzy Finding
if [ -d ~/.fzf ]; then
	echo 'fzf already installed'
else
	git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
	~/.fzf/install
fi

# if [ -d ~/.i3 ]; then
# 	echo 'i3 already installed'
# else
# 	/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2024.03.04_all.deb keyring.deb SHA256:f9bb4340b5ce0ded29b7e014ee9ce788006e9bbfe31e96c09b2118ab91fca734
# 	sudo apt install ./keyring.deb
# 	sudo apt update
# 	sudo apt install -y i3
#

sudo apt autoremove -y
