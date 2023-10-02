## aliases

alias zshrc="vim ~/.zshrc"
alias dotfiles="cd ~/.dotfiles"
alias grep='rg'
alias :q="exit"
alias follow="tail -f -n +1"
alias cat="bat"
alias dog="dog A NS"

# python
alias python="python3"
alias pip="pip3"
alias pip-all="pip freeze --local | grep -v '^\-e' | cut -d = -f 1 | xargs -n1 pip install -U"

# if exa exists, use it
if (( ${+commands[exa]} )); then
    alias l='exa'
    alias ls='exa -l'
    alias la='exa -la'
    alias lll='exa -l | less'
    alias llt='exa -T'
    alias llfu='exa -bghHliS --git'
else
    alias l='ls -1A'         # Lists in one column, hidden files.
    alias ll='ls -lh'        # Lists human readable sizes.
    alias lr='ll -R'         # Lists human readable sizes, recursively.
    alias la='ll -A'         # Lists human readable sizes, hidden files.
    alias lm='la | "$PAGER"' # Lists human readable sizes, hidden files through pager.
    alias lx='ll -XB'        # Lists sorted by extension (GNU only).
    alias lk='ll -Sr'        # Lists sorted by size, largest last.
    alias lt='ll -tr'        # Lists sorted by date, most recent last.
    alias lc='lt -c'         # Lists sorted by date, most recent last, shows change time.
    alias lu='lt -u'         # Lists sorted by date, most recent last, shows access time.
fi
alias sl='ls' # If I miss spell

# django
alias drunser='python manage.py runserver'
alias dmakemig='python manage.py makemigrations'
alias dmigrate='python manage.py migrate'
alias dshell='python manage.py shell'

# faster backward folder
alias ..="cd .."
alias ...="cd ../../"
alias ....="cd ../../../"
alias .....="cd ../../../../"
