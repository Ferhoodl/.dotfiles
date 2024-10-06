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

" Tweaks for Netrw browsing
let g:netrw_banner = 0 " disable annowing banner at top
let g:netrw_browse_split = 2 " open prior window
let g:netrw_altv = 1 " open splits to the right
let g:netrw_liststyle = 3 " Tree view

" remap vertical resize to something feasible
command! -nargs=1 Vr vertical resize <args>
