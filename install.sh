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