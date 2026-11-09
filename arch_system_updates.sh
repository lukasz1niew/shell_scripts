#!/usr/bin/env bash

# colours
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# track failures
FAILED=0

# temporary output logs
PACMAN_LOG=$(mktemp)
AUR_LOG=$(mktemp)

# system update header
echo ""
echo "***********************************"
echo "***   ARCHLINUX SYSTEM UPDATE   ***"
echo "***********************************"
echo ""

# update pacman + show status
echo -n "[1/2] PACMAN UPDATE "
if sudo pacman -Syu --noconfirm > "$PACMAN_LOG" 2>&1; then
    echo -e "${GREEN}[SUCCESS]${NC}"
else
    FAILED=1
    echo -e "${RED}[FAILED]${NC}"
fi

# update aur + show status
echo -n "[2/2] AUR UPDATE    "
if paru -Syu --noconfirm > "$AUR_LOG" 2>&1; then
    echo -e "${GREEN}[SUCCESS]${NC}"
else
    FAILED=1
    echo -e "${RED}[FAILED]${NC}"
fi

echo ""

# create failure log if anything failed
if (( FAILED )); then
    {
        echo "==================================="
        echo "ARCHLINUX UPDATE FAILURE LOG"
        echo "Date: $(date)"
        echo "==================================="
        echo ""

        if [[ -s "$PACMAN_LOG" ]]; then
            echo "===== PACMAN OUTPUT ====="
            cat "$PACMAN_LOG"
            echo ""
        fi

        if [[ -s "$AUR_LOG" ]]; then
            echo "===== AUR OUTPUT ====="
            cat "$AUR_LOG"
            echo ""
        fi
    } > /tmp/failed_updates.log

    echo -e "${RED}One or more updates failed. See /tmp/failed_updates.log${NC}"
else
    rm -f /tmp/failed_updates.log
fi

# cleanup temporary files
rm -f "$PACMAN_LOG" "$AUR_LOG"
