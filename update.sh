#!/usr/bin/env bash

# colours
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# system update header
echo ""
echo -e "***********************************"
echo -e "***   ARCHLINUX SYSTEM UPDATE   ***"
echo -e "***********************************"
echo ""

# update pacman + show status
echo -n "[1/2] PACMAN UPDATE "
if sudo pacman -Syu --noconfirm > /dev/null 2>&1; then
	echo -e "${GREEN}[SUCCESS]${NC}"
else 
	echo -e "${RED}[FAILED]{NC}"
fi

# update aur + show status
echo -n "[2/2] AUR UPDATE    "
if paru -Syu --noconfirm > /dev/null 2>&1; then
	echo -e "${GREEN}[SUCCESS]${NC}"
else
	echo -e "${RED}[FAILED]${NC}"
fi

# show disk space
echo ""
duf /
