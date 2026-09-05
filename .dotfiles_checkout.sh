#!/usr/bin/env bash

set -euo pipefail

git clone --bare git@github.com:mealbinjohansson/dotfiles.git "$HOME/.dotfiles"

dotfiles() {
    git --git-dir="$HOME/.dotfiles" --work-tree="$HOME" "$@"
}

dotfiles config --local status.showUntrackedFiles no
dotfiles checkout
