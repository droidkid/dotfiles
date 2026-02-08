#!/bin/bash
set -euo pipefail

# Dotfiles setup script for Ubuntu/Debian
# Automates the setup described in README.md
#
# NOTE: This script requires an SSH key configured for GitHub
#       (used for the bare repo clone: git@github.com:droidkid/dotfiles)

DOTFILES_REPO="git@github.com:droidkid/dotfiles"
CFG_DIR="$HOME/.cfg"
BACKUP_DIR="$HOME/dotfiles_backup_$(date +%Y%m%d_%H%M%S)"

# Files to back up before overwriting
DOTFILES_TO_BACKUP=(
  "$HOME/.bashrc"
  "$HOME/.vimrc"
  "$HOME/.tmux.conf"
  "$HOME/.config/i3/config"
  "$HOME/.config/nvim/init.lua"
)

###############################################################################
# Helper functions
###############################################################################

info() {
  echo -e "\033[1;34m==>\033[0m \033[1m$*\033[0m"
}

warn() {
  echo -e "\033[1;33m==> WARNING:\033[0m $*"
}

success() {
  echo -e "\033[1;32m==>\033[0m $*"
}

config() {
  /usr/bin/git --git-dir="$CFG_DIR" --work-tree="$HOME" "$@"
}

###############################################################################
# 1. Backup existing dotfiles
###############################################################################

info "Backing up existing dotfiles to $BACKUP_DIR"

backed_up=0
for file in "${DOTFILES_TO_BACKUP[@]}"; do
  if [ -f "$file" ]; then
    mkdir -p "$BACKUP_DIR/$(dirname "${file#$HOME/}")"
    cp "$file" "$BACKUP_DIR/${file#$HOME/}"
    echo "  Backed up: $file"
    backed_up=$((backed_up + 1))
  fi
done

if [ "$backed_up" -eq 0 ]; then
  echo "  No existing dotfiles to back up."
else
  success "Backed up $backed_up file(s)."
fi

###############################################################################
# 2. Install system packages
###############################################################################

info "Installing system packages via apt"

sudo apt update && sudo apt install -y \
  git curl vim neovim tmux \
  fzf universal-ctags jq \
  i3 i3status i3lock xss-lock dex dmenu arandr \
  texlive-latex-base texlive-fonts-recommended texlive-fonts-extra texlive-latex-extra

success "System packages installed."

###############################################################################
# 3. Set up bare git repo for dotfiles
###############################################################################

info "Setting up bare git repo for dotfiles"

if [ -d "$CFG_DIR" ]; then
  warn "$CFG_DIR already exists, skipping bare repo clone."
else
  git clone --bare "$DOTFILES_REPO" "$CFG_DIR"
  success "Bare repo cloned to $CFG_DIR"
fi

# Checkout dotfiles into $HOME (backed-up files will be overwritten)
config checkout -f
config config --local status.showUntrackedFiles no

success "Dotfiles checked out into \$HOME."

exit

###############################################################################
# 4. Install Vundle and Vim plugins
###############################################################################

info "Installing Vundle and Vim plugins"

if [ -d "$HOME/.vim/bundle/Vundle.vim" ]; then
  warn "Vundle already installed, skipping clone."
else
  git clone https://github.com/VundleVim/Vundle.vim.git "$HOME/.vim/bundle/Vundle.vim"
  success "Vundle cloned."
fi

info "Installing Vim plugins headlessly (this may take a moment)"
vim +PluginInstall +qall
success "Vim plugins installed."

###############################################################################
# 5. Install Neovim plugins (lazy.nvim)
###############################################################################

info "Installing Neovim plugins via lazy.nvim (this may take a moment)"
nvim --headless '+Lazy! sync' +qa
success "Neovim plugins installed."

###############################################################################
# 6. Install Rust via rustup
###############################################################################

info "Installing Rust via rustup"

if command -v rustup &>/dev/null; then
  warn "rustup already installed, skipping."
else
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
  # shellcheck disable=SC1091
  source "$HOME/.cargo/env"
  success "Rust installed."
fi

###############################################################################
# 6. Post-install summary
###############################################################################

echo ""
echo "============================================="
info "Setup complete!"
echo "============================================="
echo ""
echo "  Backups:      $BACKUP_DIR"
echo "  Bare repo:    $CFG_DIR"
echo "  Vundle:       ~/.vim/bundle/Vundle.vim"
echo ""
echo "  Remaining manual steps:"
echo "    1. Log out and back in for i3 and shell changes to take effect"
echo ""
success "Done!"
