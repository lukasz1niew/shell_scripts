#!/usr/bin/env bash

packages=(
	# system utilities 
		eza
		btop
		bat
		fzf
		fish
		neovim
		neofetch
		starship
		nautilus
		unzip
		rofi

	# hyprland
		waybar
		hyprshot
		hyprlock
		hypridle
		hyprpicker

	# audio
		pavucontrol

	# fonts
		ttf-jetbrains-mono-nerd
		nerd-fonts-sf-mono

	# appearance
		swaync
		nwg-look
		awww
		caelestia-sddm-locklike-git
		catppuccin-gtk-theme-mocha

	# proton
		proton-vpn-gtk-app
		proton-pass-bin
	)

for package in ${packages[@]}; do
  paru -S --noconfirm ${package}
done
