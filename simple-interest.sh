#!/usr/bin/env bash

set -euo pipefail

read -r -p "Enter principal: " principal
read -r -p "Enter annual rate (%): " rate
read -r -p "Enter time (years): " time

if ! [[ "$principal" =~ ^[0-9]+([.][0-9]+)?$ && "$rate" =~ ^[0-9]+([.][0-9]+)?$ && "$time" =~ ^[0-9]+([.][0-9]+)?$ ]]; then
  echo "Please enter non-negative numeric values."
  exit 1
fi

interest=$(awk -v principal="$principal" -v rate="$rate" -v time="$time" 'BEGIN { printf "%.2f", principal * rate * time / 100 }')
total=$(awk -v principal="$principal" -v interest="$interest" 'BEGIN { printf "%.2f", principal + interest }')

echo "Simple interest: $interest"
echo "Total amount: $total"
