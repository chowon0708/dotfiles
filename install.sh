#!/bin/bash
DIR="$(cd "$(dirname "$0")" && pwd)"
ln -sf "$DIR/tmux.conf" ~/.tmux.conf
