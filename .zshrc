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
export PATH=$HOME/Scripts/go/bin:/usr/local/bin:$HOME/.cargo/bin:/usr/local/opt/python/libexec/bin:$HOME/Library/Python/3.7/bin:$HOME/Scripts/:$PATH
# Dotfiles
export DOTFILES_PATH=$HOME/.dotfiles/
# Lib
export LD_LIBRARY_PATH=/usr/local/lib:$LIBRARY_PATH
# Golang
export GOPATH=$HOME/Scripts/go
# zsh
export ZSH="$DOTFILES_PATH/.oh-my-zsh"
# Default Language
export LANG=en_US.UTF-8
# Default Editor
export EDITOR='vim'


### theme ###
#
# Local theme
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
DEFAULT_USER=kessyus


### functions ####
#
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