#!/bin/bash

ROOT="$(dirname ${BASH_SOURCE[0]})"

# packages
sudo pacman -S \
	neovim iwd pipewire wireplumber pipewire-audio pipewire-pulse easyeffects \
	xorg-server xorg-xrandr noto-fonts-cjk noto-fonts-emoji \
	fcitx5-im fcitx5-rime fcitx5-unikey xclip tmux breeze-icons libreoffice-fresh \
	thunderbird firefox chromium sddm acpid jq xsettingsd less bluez bluez-utils blueman \
	just zsh docker docker-compose docker-buildx minikube nix go rustup ripgrep fd kubectl helm \
	wget openssh lazygit unzip luarocks python-pip python-pynvim python-pipx python-numpy \
	lximage-qt lxqt-admin lxqt-archiver lxqt-config lxqt-globalkeys lxqt-notificationd \
	lxqt-panel lxqt-policykit lxqt-powermanagement lxqt-qtplugin lxqt-runner lxqt-session \
	lxqt-sudo lxqt-themes obconf-qt openbox pcmanfm-qt obs-studio mpv unixodbc wezterm nvm fzf \
	fish packer terraform tectonic

# yay & aur packages
if ! command -v yay >/dev/null 2>&1; then
	mkdir -p ~/projects && cd ~/projects
	sudo pacman -S --needed git base-devel &&
		git clone https://aur.archlinux.org/yay.git &&
		cd yay &&
		makepkg -si
	cd ~ && rm -rf ~/projects/yay
fi

yay ttf-nerd-fonts-symbols-mono
yay visual-studio-code-bin
yay slack-desktop
yay google-cloud-cli
yay google-cloud-cli-gke-gcloud-auth-plugin
yay qps
yay ghcup-hs-bin
yay hadolint-bin

# enable services
sudo systemctl enable sddm
sudo systemctl enable acpid
sudo systemctl enable bluetooth

cd $ROOT
# font configs
sudo cp ./font/64-language-selector-prefer.conf /etc/fonts/conf.d/

# add hybrid sleep
sudo mkdir -p /etc/systemd/sleep.conf.d
sudo cp ./etc/systemd/hybrid-sleep.conf /etc/systemd/sleep.conf.d

# audio

# link nvim configs
ln -s "$ROOT/../.config/nvim" ~/.config/nvim

## install easyeffects preset
bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"
curl https://raw.githubusercontent.com/jtrv/.cfg/morpheus/.config/easyeffects/input/fifine_male_voice_noise_reduction.json --output ~/.config/easyeffects/input/fifine_male_voice_noise_reduction.json

# install nvm and global node packages
nvm install node && nvm alias default node
npm install -g neovim tree-sitter @mermaid-js/mermaid-cli prettier

# setup rust
rustup default stable

# setup ghcup
ghcup install ghc
ghcup install cabal

# LXQt configs
if [[ ! -d ~/.themes ]]; then
	git clone https://github.com/addy-dclxvi/openbox-theme-collections ~/.themes
	rm -rf ~/.themes/.git
fi

if [[ ! -d "/usr/share/lxqt/themes" ]]; then
	mkdir temp && cd temp
	wget https://github.com/catppuccin/lxqt/releases/download/v1.0.0-lxqt/Catppuccin.zip && unzip Catppuccin.zip
	sudo mv Catppuccin /usr/share/lxqt/themes/
	cd ../ && rm -r temp
fi

cd $ROOT
mkdir -p ~/.local/share && cp -r ../lxqt ~/.local/share/

# tmux
mkdir -p ~/.config/tmux && ln -s "$ROOT/../.config/tmux/tmux.conf" ~/.config/tmux/tmux.conf

if [[ ! -d ~/.config/tmux/plugins/tpm ]]; then
	git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
fi
