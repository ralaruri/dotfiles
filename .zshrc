# Poetry — Python dependency manager
export PATH="$HOME/.poetry/bin:$PATH"

# Local bin scripts
export PATH=$PATH:$HOME/bin/

# Disable default macOS LSCOLORS (let starship/other tools handle it)
export CLICOLOR=0

# Starship — cross-shell prompt
eval "$(starship init zsh)"

# Direnv — auto-load .envrc per directory
eval "$(direnv hook zsh)"

# asdf — runtime version manager (node, python, ruby, etc.)
. /usr/local/opt/asdf/libexec/asdf.sh

# Use neovim as default editor
alias vim=nvim

# Rust/Cargo toolchain
. "$HOME/.cargo/env"

# pnpm — fast Node.js package manager
export PNPM_HOME="/Users/ramzi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Google Cloud SDK — use asdf-managed Python
export CLOUDSDK_PYTHON=$(asdf which python3)
