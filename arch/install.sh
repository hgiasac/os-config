# packages
sudo pacman -S \
	neovim iwd pipewire wireplumber pipewire-audio pipewire-pulse easyeffects \
	nvidia xorg-server xorg-xrandr noto-fonts-cjk noto-fonts-emoji \
	fcitx5-im fcitx5-rime fcitx5-unikey \
	thunderbird firefox chromium \
	xfce4 thunar-archive-plugin thunar-media-tags-plugin xfce4-battery-plugin \
	xfce4-clipman-plugin xfce4-mount-plugin xfce4-notifyd xfce4-pulseaudio-plugin \
	xfce4-screensaver xfce4-screenshooter xfce4-sensors-plugin xfce4-cpugraph-plugin \
	xfce4-systemload-plugin xfce4-taskmanager \
	just zsh docker minikube nix go rust ripgrep fd \
	wget openssh lazygit unzip luarocks

# yay & aur packages
mkdir ~/projects && cd ~/projects
pacman -S --needed git base-devel &&
	git clone https://aur.archlinux.org/yay.git &&
	cd yay &&
	makepkg -si
cd ~ && rm -rf ~/projects/yay
yay nvm ttf-nerd-fonts-symbols-mono visual-studio-code-bin

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
