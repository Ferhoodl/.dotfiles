let mapleader = '\' " leader for plugin and user-defined shortcuts. Don't want to conflict with i3, tmux, vim

" Set relative line numbers
set relativenumber

set nocompatible " Tell vim not to pretend to be vi

syntax enable " Enable some syntax highlighting

filetype plugin on " *look up what this does*

set path+=** "search down into sub-folders when using ':find'. Provides tab-completion

command! MakeTags !ctags -R . " Create the 'tags file (may need to install ctags first)

set wildmenu " turn on menu for fuzzy file finding

" Tweaks for Netrw browsing
let g:netrw_banner = 0 " disable annowing banner at top
let g:netrw_browse_split = 4 " 3 = opens new tabs in a new vim tab. 2 = split
" screen on new tab, 4 = replace previous screen with new tab
let g:netrw_altv = 1 " open splits to the right 
let g:netrw_liststyle = 3 " Tree view
let g:netrw_winsize = 80 " change default netrw window open size

" remap 'vertical resize' command to something feasible
command! -nargs=1 Vr vertical resize <args>

" Go to tab by number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
