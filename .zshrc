export PATH="$HOME/.poetry/bin:$PATH"
export PATH=$PATH:$HOME/bin/

export CLICOLOR=0
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

complete -o nospace -C /usr/local/bin/terraform terraform

. /usr/local/opt/asdf/libexec/asdf.sh

alias vim=nvim
