## .zshrc

source $HOME/.dotfiles/.zsh/exports.zsh
source $HOME/.dotfiles/.zsh/init.zsh
source $HOME/.dotfiles/.zsh/aliases.zsh
source $HOME/.dotfiles/.zsh/history.zsh
source $HOME/.dotfiles/.zsh/functions.zsh

# Fzf useful key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Starship
eval "$(starship init zsh)"
