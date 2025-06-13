#!/bin/bash

# Define status map
declare -A status_map=(
  [0]="all"
  [1]="running"
  [2]="exited"
  [3]="created"
  [4]="paused"
  [5]="restarting"
  [6]="removing"
  [7]="dead"
)

# Show options
echo "Choose one or more container statuses by number (space-separated):"
echo "0) all"
echo "1) running"
echo "2) exited"
echo "3) created"
echo "4) paused"
echo "5) restarting"
echo "6) removing"
echo "7) dead"

# Read input
read -p "Enter your choices: " -a choices

# Build docker command
cmd="docker ps -a"
valid_choice=false

for choice in "${choices[@]}"; do
    status="${status_map[$choice]}"
    if [[ -n "$status" ]]; then
      echo "The value of status is: $status"
        if [ "$status" = "all" ]; then
          echo "all option selected"
          cmd="docker ps -a"
          valid_choice=true
          break
        fi
        cmd+=" --filter status=$status"
        valid_choice=true
    else
        echo "Invalid choice: $choice (ignored)"
    fi
done

# Run if at least one valid filter was selected
if [[ "$valid_choice" = true ]]; then
    echo "Running: $cmd"
    eval "$cmd"
else
    echo "No valid status selected. Exiting."
    exit 1
fi
