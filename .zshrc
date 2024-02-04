# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
autoload -Uz compinit
compinit

export PATH="$HOME/.poetry/bin:$PATH"
# poetry completions zsh> ~/.zfunc/_poetry 
export PATH=$PATH:$HOME/bin/

export CLICOLOR=0
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform

# autoload -Uz compinit
# compinit
# compinitautoload -Uz compinit && compinit
autoload -Uz compinit && compinit
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi

#. $(brew --prefix asdf)/asdf.sh

. /usr/local/opt/asdf/libexec/asdf.sh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
alias config='/usr/bin/git --git-dir=/Users/ramzi/documents/projects/dotfiles/.git --work-tree=/Users/ramzi/dotfiles'
alias vim=nvim
