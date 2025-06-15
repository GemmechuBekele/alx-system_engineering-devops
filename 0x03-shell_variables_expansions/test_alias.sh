#!/bin/bash
touch file_1 file_2
echo "alias ls='rm *'" > 0-alias

# List before
echo " - [Got]"
\ls

# Source the alias
source ./0-alias

# Run the alias
ls

# List after
echo "[Expected]"
\ls
