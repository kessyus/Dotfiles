# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

### alias ###
#
alias grep="grep --color=auto"
alias sgrep="grep -R -n -H -C 5 --exclude-dir={.git,.svn,CVS} "
alias :q="exit"
alias follow="tail -f -n +1"
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vim/vimrc"
alias fd="find . -type d 2>/dev/null -name"
alias ff="find . -type f 2>/dev/null -name"

### exports ###
#
# Path
export PATH=$HOME/Scripts/go/bin:/usr/local/bin:$HOME/.cargo/bin:/usr/local/opt/python/libexec/bin:$HOME/Library/Python/3.7/bin:$HOME/usr/local/opt/node@14/bin:/Users/kessyus/Library/Python/3.8/bin:$PATH
# Dotfiles
export DOTFILES_PATH=$HOME/.dotfiles
# Lib
export LD_LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
# Golang
export GOPATH=$HOME/Scripts/go
# zsh
export ZSH="$DOTFILES_PATH/.oh-my-zsh"
# Default Language
export LANG=en_US.UTF-8
# Default Editor
export EDITOR='code'
# NodeJS testing port
export PORT='3001'

### codi ###
#
# Codi
# Usage: codi [filetype] [filename]
codi() {
  local syntax="${1:-python3}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

### theme ###
#
# Local theme
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#DEFAULT_USER=kessyus
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

### functions ####
#
# Open all modified files in vim tabs
function vimod {
    vim -p $(git status -suall | awk '{print $2}')
}

# Add Commit Push at once
# Usage:
# acp "commit message"
function acp() {
  git add .
  git commit -m "$1"
  git push
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

### plugins ###
#
plugins=(
          git
          vi-mode
          man
          osx
          colored-man-pages
          common-aliases
          tmux
        )


### other stuff ###
#
# Fix Mac Terminal
DISABLE_AUTO_TITLE="true"

source $ZSH/oh-my-zsh.sh
fpath+=${ZDOTDIR:-~}/.zsh_functions

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
