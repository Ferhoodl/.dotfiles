let mapleader = "'" "leader for plugin and user-defined shortcuts. Don't want to conflict with i3, tmux, vim

" Set relative line numbers
set relativenumber

" turn auto-indenting on
set autoindent

set nocompatible " Tell vim not to pretend to be vi

syntax enable " Enable some syntax highlighting

filetype plugin on " *look up what this does*

set path+=** "search down into sub-folders when using ':find'. Provides tab-completion

command! MakeTags !ctags -R . " Create the 'tags file (may need to install ctags first)

set wildmenu " turn on menu for fuzzy file finding

" Tweaks for Netrw browsing
let g:netrw_banner = 0 " disable annowing banner at top
let g:netrw_browse_split = 3 " 3 = opens new tabs in a new vim tab. 2 = split
" screen on new tab, 4 = replace previous screen with new tab
let g:netrw_liststyle = 3 " Tree view
let g:netrw_altofile = 0 " Prevents vim from focusing on opened split file

" Following are useful when trying to do mutliple windows/screen
" let g:netrw_winsize = 80 " change default netrw window open size
" let g:netrw_altv = 1 " open splits to the right 

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

" Function to customize netrw's behavior when opening files
function! NetrwOpenBehavior()
  " Get the number of windows in the current tab
  let wincount = winnr('$')

  " If there is only one window and it's netrw, open the file in a new tab
  if wincount == 1  && &filetype == 'netrw'
    let g:netrw_browse_split = 3 " Open in a new tab
  " If there are two windows, open the file in the non-netrw split
  elseif wincount > 2  && &filetype == 'netrw'
    let g:netrw_browse_split = 4 " Open in the other split
  else
    let g:netrw_browse_split = 0 " Default behavior
  endif
endfunction

" Autocommand to trigger Netrw behavior adjustment on file navigation
autocmd FileType netrw call NetrwOpenBehavior()

" Write function to insert a code snippet based on input
function! InsertSkeletonFile(filetype)
    let skeleton_path = ''
    " Define different skeletons based on the filetype passed in
    if a:filetype ==# 'doc'
        let skeleton_path = $HOME . '/.vim/.skeletons/.skeleton.html'
    elseif a:filetype ==# 'css'
        let skeleton_path = $HOME . '/.vim/skeletons/.skeleton.css'
    elseif a:filetype ==# 'js'
        let skeleton_path = $HOME . '/.vim/skeletons/.skeleton.js'
    else
        echo "Unknown skeleton type: " . a:filetype
        return
    endif

    " Insert the skeleton file above the current line
    execute ':-1read ' . skeleton_path
    normal! 6jzzf>a
endfunction

set wrap

set linebreak

set breakindent

" Map <leader>sk to call code above snippet function with input from this line
nnoremap <leader>sk :call InsertSkeletonFile(input('Enter filetype:'))<CR>

