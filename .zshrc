### exports ###
#
# Path
export PATH=$PATH:/usr/local/bin:$HOME/.cargo/env:$HOME/.dotfiles/bin:$HOME:/.dotnet/tools
# Android Dev
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
# Lib
export LD_LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
# Default Language
export LANG=pt_BR.UTF-8
# Default Editor
export EDITOR='vim'
# FZF config
export FZF_DEFAULT_COMMAND="rg --files"
export FZF_DEFAULT_OPTS='-m --height 40% --border'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
# Hackerrank
export OUTPUT_PATH=$PWD/.output

### functions ####
#
# Add Commit Push at once
# Usage:
# acp "commit message"
function acp() {
  git add .
  git commit -m "$1"
  git push
}

# Open all modified files in vim tabs
function vimod {
    vim -p $(git status -suall | awk '{print $2}')
}

# Open files modified in a git commit in vim tabs; defaults to HEAD.
# Examples:
#     virev 49808d5
#     virev HEAD~3
function virev {
    commit=$1
    if [ -z "${commit}" ]; then
      commit="HEAD"
    fi
    rootdir=$(git rev-parse --show-toplevel)
    sourceFiles=$(git show --name-only --pretty="format:" ${commit} | grep -v '^$')
    toOpen=""
    for file in ${sourceFiles}; do
      file="${rootdir}/${file}"
      if [ -e "${file}" ]; then
        toOpen="${toOpen} ${file}"
      fi
    done
    if [ -z "${toOpen}" ]; then
      echo "No files were modified in ${commit}"
      return 1
    fi
    vim -p ${toOpen}
}

### upgrade homebrew ###
#
function update() {
  brew update
  brew upgrade
  brew cleanup
}


### plugins ###
#
plugins=(
          git
          git-prompt
          vi-mode
          docker
          osx
          man
          colored-man-pages
        )


### other stuff ###
#
# Fix Mac Terminal
DISABLE_AUTO_TITLE="true"

fpath+=${ZDOTDIR:-~}/.zsh_functions

# Fzf useful key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zsh Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zsh autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh


### alias ###
#
alias l='exa'
alias ls='exa -l'
alias la='exa -la'
alias :q="exit"
alias follow="tail -f -n +1"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vim/vimrc"
alias python="python3"
alias pip="pip3"
alias lsd="ls -ld *(-/DN)"
alias todo="vim ~/Desktop/TODO.txt"
alias cat="bat"
alias gco="git branch | fzf | xargs git checkout"


# Starship - Needs to be in the end of zshrc
eval "$(starship init zsh)"
