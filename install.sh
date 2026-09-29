#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"
ln -sf "$DIR/tmux.conf" ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm