" Set relative line numbers
set relativenumber

" Tell vim not to pretend to act like vi
set nocompatible

" Enable some syntax highlighting
syntax enable

" 
filetype plugin on

" search down into subfolders when using 'find'
" provides tab-completion
set path+=**

" Create the 'tags file (may need to install ctags first)
command! MakeTags !ctags -R .

" turn on menu for fuzzy file finding
set wildmenu
