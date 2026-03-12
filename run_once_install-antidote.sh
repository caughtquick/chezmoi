#!/bin/bash

# Define antidote directory
ANTIDOTE_DIR="${HOME}/.local/share/antidote"

# Clone antidote if not present
if [ ! -d "$ANTIDOTE_DIR" ]; then
    echo "Cloning Antidote..."
    git clone --depth=1 https://github.com/mattmc3/antidote.git "$ANTIDOTE_DIR"
fi
