export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:$HOME/bin/

export CLICOLOR=0
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

. /usr/local/opt/asdf/libexec/asdf.sh

alias vim=nvim

. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/Users/ramzi/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

export CLOUDSDK_PYTHON=$(asdf which python3)
