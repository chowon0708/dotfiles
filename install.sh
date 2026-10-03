#!/bin/bash
# The folder this script is in, so it works wherever you clone the repo
DIR="$(cd "$(dirname "$0")" && pwd)"

# tmux config
ln -sf "$DIR/tmux.conf" ~/.tmux.conf

# tmux plugin manager + plugins
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
~/.tmux/plugins/tpm/bin/install_plugins

# Claude Code (skip if already installed)
if ! command -v claude >/dev/null 2>&1 && [ ! -x ~/.local/bin/claude ]; then
    curl -fsSL https://claude.ai/install.sh | bash
fi

# Git identity (noreply email so commits link to GitHub without exposing a real address)
git config --global user.name "Shinwon Lee"
git config --global user.email "150661623+chowon0708@users.noreply.github.com"

# GitHub CLI (skip if already installed)
if ! command -v gh >/dev/null 2>&1; then
    sudo apt install -y gh
fi

# GitHub login (skip if already logged in)
if ! gh auth status -h github.com >/dev/null 2>&1; then
    gh auth login -h github.com -p https --web
fi

