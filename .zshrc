## .zshrc

source $HOME/.dotfiles/.zsh/exports.zsh
source $HOME/.dotfiles/.zsh/init.zsh
source $HOME/.dotfiles/.zsh/aliases.zsh
source $HOME/.dotfiles/.zsh/history.zsh
source $HOME/.dotfiles/.zsh/functions.zsh

# antigen
source /usr/local/share/antigen/antigen.zsh
source $HOME/.dotfiles/.zsh/antigen.zsh

# preferred editor for local and remote sessionsk
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Fzf useful key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Starship
eval "$(starship init zsh)"
