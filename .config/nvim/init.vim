" Author: Kessyus Fófano <kessyus@gmail.com>
"
" Copyright (C) 2012-2021  Kessyus Fófano
"
" This program is free software: you can redistribute it and/or modify
" it under the terms of the GNU General Public License as published by
" the Free Software Foundation, either version 3 of the License, or
" (at your option) any later version.
"
" This program is distributed in the hope that it will be useful,
" but WITHOUT ANY WARRANTY; without even the implied warranty of
" MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
" GNU General Public License for more details.
"
" You should have received a copy of the GNU General Public License
" along with this program.  If not, see <http://www.gnu.org/licenses/>.
"
" Commentary:
"
" Entry point for my Vim setup.  This module's main goal is to load
" Vim configuration the way I'm pleased to use it. =]
"
" Code:

" Initial options
if &compatible | set nocompatible | endif
if (has('nvim') || has('termguicolors')) | set termguicolors | endif
syntax on

" Import modules
source ~/.dotfiles/.config/nvim/viml/plugins.vim
source ~/.dotfiles/.config/nvim/viml/options.vim
source ~/.dotfiles/.config/nvim/viml/coc.vim
source ~/.dotfiles/.config/nvim/viml/config.vim
source ~/.dotfiles/.config/nvim/viml/keymap.vim

" Colorscheme
colorscheme base16-gruvbox-dark-medium
