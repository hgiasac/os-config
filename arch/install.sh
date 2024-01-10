# packages
sudo pacman -S \
	neovim iwd pipewire wireplumber pipewire-audio pipewire-pulse easyeffects \
	nvidia xorg-server xorg-xrandr noto-fonts-cjk noto-fonts-emoji \
	fcitx5-im fcitx5-rime fcitx5-unikey xclip tmux breeze-icons \
	thunderbird firefox chromium sddm acpid jq xsettingsd less \
	just zsh docker docker-compose docker-buildx minikube nix go rustup ripgrep fd kubectl helm \
	wget openssh lazygit unzip luarocks python-pip python-pynvim \
	lximage-qt lxqt-admin lxqt-archiver lxqt-config lxqt-globalkeys lxqt-notificationd \
	lxqt-panel lxqt-policykit lxqt-powermanagement lxqt-qtplugin lxqt-runner lxqt-session \
	lxqt-sudo lxqt-themes obconf-qt openbox pcmanfm-qt obs-studio mpv unixodbc

# yay & aur packages
mkdir ~/projects && cd ~/projects
pacman -S --needed git base-devel &&
	git clone https://aur.archlinux.org/yay.git &&
	cd yay &&
	makepkg -si
cd ~ && rm -rf ~/projects/yay
yay nvm ttf-nerd-fonts-symbols-mono visual-studio-code-bin slack-desktop \
	google-cloud-cli google-cloud-cli-gke-gcloud-auth-plugin qps ghcup-hs-bin

# enable services
sudo systemctl enable sddm
sudo systemctl enable acpid

# font configs
sudo cp font/64-language-selector-prefer.conf /etc/fonts/conf.d/

# add hybrid sleep
sudo mkdir -p /etc/systemd/sleep.conf.d
sudo cp ./etc/systemd/hybrid-sleep.conf /etc/systemd/sleep.conf.d

# audio

# link nvim configs
ln -s ../.config/nvim ~/.config/nvim

## install easyeffects preset
bash -c "$(curl -fsSL https://raw.githubusercontent.com/JackHack96/PulseEffects-Presets/master/install.sh)"
curl https://raw.githubusercontent.com/jtrv/.cfg/morpheus/.config/easyeffects/input/fifine_male_voice_noise_reduction.json --output ~/.config/easyeffects/input/fifine_male_voice_noise_reduction.json

# install nvm and global node packages
nvm install node && nvm alias default node
npm install -g neovim tree-sitter

# setup rust
rustup default stable

# setup ghcup
ghcup install ghc
ghcup install cabal

# LXQt configs
git clone https://github.com/addy-dclxvi/openbox-theme-collections ~/.themes
rm -rf ~/.themes/.git
mkdir temp && cd temp
wget https://github.com/catppuccin/lxqt/releases/download/v1.0.0-lxqt/Catppuccin.zip && unzip Catppuccin.zip
sudo mv Catppuccin /usr/share/lxqt/themes/
cd ../ && rm -r temp
mkdir -p ~/.local/share && cp -r ../lxqt ~/.local/share/

# tmux
mkdir -p ~/.config/tmux && ln -s ../.config/tmux/tmux.conf ~/.config/tmux/tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.config/tmux/plugins/tpm
