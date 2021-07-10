## exports

# PATH
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin
# rust cargo
export PATH=$PATH:$HOME/.cargo/env
# doftiles bin
export PATH=$PATH:$HOME/.dotfiles/bin
# android dev
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# golang
export GOPATH=$HOME/Projects/go
export PATH=$PATH:$GOPATH/bin

# language
export LANG=en_US.UTF-8
# lib
export LD_LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH

# vimrc
export MYVIMRC=$HOME/.dotfiles/config/nvim

# FZF config
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS='-m --height 40% --layout=reverse --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# personal
export PROJECT_HOME=$HOME/Projects

# zsh_autosuggest
export ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
export ZSH_AUTOSUGGEST_USE_ASYNC=1
