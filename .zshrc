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
export PATH="$HOME/.local/bin:$PATH"

# --- Zsh Plugins ---

# Autosuggestions — grey text inline suggestions from history
source /usr/local/opt/zsh-autosuggestions/share/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#808080"

# Syntax highlighting — colorizes commands as you type
source /usr/local/opt/zsh-syntax-highlighting/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# --- nb daily note ---

# Create or open today's daily note in nb, organized by month folder
nb-daily() {
  local month=$(date +"%Y-%m")
  local today=$(date +"%Y-%m-%d")
  local title=$(date +"%A, %B %d, %Y")
  local template="$HOME/.config/nb/templates/daily.md"

  if nb ls "${month}/${today}.md" &>/dev/null; then
    nb edit "${month}/${today}.md"
  else
    nb add "${month}/${today}.md" \
      --content "$(sed -e "s/__TITLE__/${title}/" -e "s/__DATE__/${today}/" "$template")"
    nb edit "${month}/${today}.md"
  fi
}
