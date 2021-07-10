## antigen plugins

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo
antigen bundle git
antigen bundle docker
antigen bundle docker-compose
antigen bundle heroku
antigen bundle pip
antigen bundle colored-man-pages
antigen bundle command-not-found

# Other Plugins
antigen bundle zsh-users/zsh-completions path:src kind:fpath
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma/fast-syntax-highlighting
antigen bundle chriskempson/base16-shell
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle Tarrasch/zsh-autoenv
antigen bundle skywind3000/z.lua

antigen apply
