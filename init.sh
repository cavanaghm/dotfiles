#!/usr/bin/env bash

rm ~/.bashrc
ln -s ~/.dotfiles/.bashrc ~/.bashrc

rm ~/.bash_aliases
ln -s ~/.dotfiles/.bash_aliases ~/.bash_aliases

rm ~/.gitconfig
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

## Move old configuration file but don't rmrf
if [ -d ~/.config/nvim ]; then
	mv ~/.config/nvim ~/.config/_nvim_old
fi
ln -s ~/.dotfiles/nvim ~/.config/

#Installs
echo 'apt-get update'
sudo apt-get update

## git
echo 'Installing git' sudo apt -y install git-all;

## wezterm
# echo 'Installing wezterm'
# curl -fsSL https://apt.fury.io/wez/gpg.key | sudo gpg --yes --dearmor -o /usr/share/keyrings/wezterm-fury.gpg
# echo 'deb [signed-by=/usr/share/keyrings/wezterm-fury.gpg] https://apt.fury.io/wez/ * *' | sudo tee /etc/apt/sources.list.d/wezterm.list
# sudo apt update
# sudo apt -y install wezterm


## Git Kraken
if test -f /usr/bin/gitkraken
then
	echo 'Gitkraken already installed'
else
	echo 'Fetching Gitkraken'
	curl -LO https://release.gitkraken.com/linux/gitkraken-amd64.deb
	echo 'Installing Gitkraken'
	sudo dpkg -i gitkraken-amd64.deb
	sudo rm gitkraken-amd64.deb
fi

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

## Packer
# @todo update to lazy.nvim
if [ -d ~/.local/share/nvim/site/pack/packer ]; then
	echo 'Packer already installed'
else
	git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim
fi



## Obsidian
if [ -f /usr/bin/obsidian ]; then
	echo 'Obsidian already installed'
else
	echo 'Fetching obsidian'
	curl -LO https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.11/obsidian_1.5.11_amd64.deb
	echo 'Installing obsidian'
	sudo dpkg -i obsidian_1.5.11_amd64.deb
	echo 'Cleaning up'
	rm obsidian_1.5.11_amd64.deb
fi

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

## Install go
echo 'Installing go'
sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.1.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
go version

## Install python
sudo apt install -y python3
sudo apt install -y python3-venv
sudo apt install -y python3-pip

## Install dotnet
curl -LO https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update
sudo apt-get install -y dotnet-sdk-8.0

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

sudo apt autoremove -y
