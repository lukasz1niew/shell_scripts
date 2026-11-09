#!/usr/bin/env bash

packages=(
	# system utilities 
		eza
		btop
		fzf
		duf
		neovim
		starship
		nautilus
		unzip
		rofi

	# hyprland
		waybar
		hyprshot
		hyprlock

	# audio
		pavucontrol

	# fonts
		ttf-jetbrains-mono-nerd
		nerd-fonts-sf-mono

	# appearance
		swaync
		nwg-look
		awww
		dracula-gtk-theme

)

for package in ${packages[@]}; do
  paru -S --noconfirm ${package}
done
