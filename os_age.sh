#!/usr/bin/env bash

birth_time=$(stat / --format=%W)

current_time=$(date +%s)

age_seconds=$((current_time - birth_time))

age_days=$((age_seconds / 86400))

echo "$HOSTNAME is $age_days days old"
