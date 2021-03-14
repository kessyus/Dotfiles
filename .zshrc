# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### alias ###
#
alias :q="exit"
alias follow="tail -f -n +1"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vim/vimrc"
alias python="python3"
alias pip="pip3"
alias lsd="ls -ld *(-/DN)"
alias todo="vim ~/Desktop/TODO.txt"
alias htop="htop -d 2" 
alias cat="bat"
alias gco="git branch | fzf | xargs git checkout"

### exports ###
#
# Path
export PATH=/usr/local/bin:$HOME/Scripts/go/bin:/usr/local/bin:$HOME/.cargo/bin:/usr/local/opt/python/libexec/bin:/Users/kessyus/Library/Python/3.8/bin:$HOME/.dotfiles/bin:$HOME/.flutter/bin:$HOME/.dotfiles/diff-so-fancy:$PATH
# Dotfiles
export DOTFILES_PATH=$HOME/.dotfiles
# Lib
export LD_LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
# zsh
export ZSH="$DOTFILES_PATH/.oh-my-zsh"
# Default Language
export LANG=pt_BR.UTF-8
# Default Editor
export EDITOR='vim'
# NodeJS testing port
export PORT='3001'
# FZF config
export FZF_DEFAULT_COMMAND="rg --files --hidden --follow --glob '!.git'"
export FZF_DEFAULT_OPTS='-m --height 40% --border'

### theme ###
#
# Local theme
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme


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


### docker functions ###
#
# Select a docker container to run
function dr() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -1 -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker start "$cid"
}
# Select a running docker container to stop
function ds() {
  local cid
  cid=$(docker ps | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker stop "$cid"
}
# Select a docker container to remove
function drm() {
  local cid
  cid=$(docker ps -a | sed 1d | fzf -q "$1" | awk '{print $1}')

  [ -n "$cid" ] && docker rm "$cid"
}


### plugins ###
#
plugins=(
          git
          git-prompt
          vi-mode
          osx
          docker
          man
          colored-man-pages
          common-aliases
        )


### other stuff ###
#
# Fix Mac Terminal
DISABLE_AUTO_TITLE="true"

source $ZSH/oh-my-zsh.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Fzf useful key bindings and fuzzy completion
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Zsh Syntax highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Zsh autosuggestions
source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Forgit
source ~/.dotfiles/forgit/forgit.plugin.zsh

# Emoji-cli
source ~/.dotfiles/emoji-cli/fuzzy-emoji-zle.zsh
