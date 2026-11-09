#!/usr/bin/env bash

# Colours
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

# Track failures
FAILED=0

# Log file
LOG_FILE="/tmp/updates.log"

# Temporary output
TEMP_LOG=$(mktemp)
trap 'rm -f "$TEMP_LOG"' EXIT

echo ""
echo "***********************************"
echo "***   ARCH LINUX SYSTEM UPDATE  ***"
echo "***********************************"
echo ""

# Function to run and log failed updates
run_update() {
    local NAME="$1"
    shift

    : > "$TEMP_LOG"

    "$@" > "$TEMP_LOG" 2>&1
    local STATUS=$?

    if (( STATUS == 0 )); then
        echo -e "${GREEN}[SUCCESS]${NC}"
    else
        FAILED=1
        echo -e "${RED}[FAILED]${NC}"

        {
            echo "==================================="
            echo "$NAME UPDATE FAILED"
            echo "Date: $(date)"
            echo "Exit code: $STATUS"
            echo "==================================="
            cat "$TEMP_LOG"
            echo ""
        } >> "$LOG_FILE"
    fi
}

# Pacman update
echo -n "[1/2] PACMAN UPDATE "
run_update "PACMAN" sudo pacman -Syu --noconfirm

# AUR update
echo -n "[2/2] AUR UPDATE    "
run_update "AUR" paru -Syu --noconfirm

echo ""

# Final status
if (( FAILED )); then
    echo "Updates failed, check $LOG_FILE"
    exit 1
else
    # Remove old log if all updates succeed
    rm -f "$LOG_FILE"
fi
