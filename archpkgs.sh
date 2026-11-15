#!/usr/bin/env bash

packages=(
	# system utilities 
		eza
		btop
		bat
		fzf
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
		hyprlidle

	# audio
		pavucontrol

	# fonts
		ttf-jetbrains-mono-nerd
		nerd-fonts-sf-mono

	# appearance
		swaync
		nwg-look
		awww
		caelestia-sddm-git
		catppuccin-gtk-theme-mocha

	# proton
		proton-vpn-gtk-app
		proton-pass-bin

  # zsh
		zsh
		zsh-autosuggestions 
		zsh-completions
	)

for package in ${packages[@]}; do
  paru -S --noconfirm ${package}
done
