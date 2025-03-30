let mapleader = "'" "leader for plugin and user-defined shortcuts.
" Don't want to conflict with i3, tmux, vim

set nocompatible " Tell vim not to pretend to be vi

filetype on " Enables automatic filtype detection
filetype plugin on " Loads file type-specific plugins which can add extra
" functionality (syntax highlighting, formatitng, etc.)
filetype indent on " Enables file-dependent indentation settings (auto
" indentation rules for c vs python)
syntax enable " Enable some syntax highlighting

" " turn auto-indenting on
" set autoindent
" " text wrapping options I don't understand. Still not working either:
" set wrap
" set linebreak
" set breakindent
  
set tabstop=4 " make tabs appear as 4 spaces in vim (defualt is 8)testing
set shiftwidth=4 " set shiftwidth set by auto-indenting things like plugins

"set indicator for line length of 81
"set colorcolumn=81
highlight ColorColumn ctermbg=DarkRed
call matchadd('ColorColumn', '\%81v', 100)

" tell colors to invert on highlight
hi Visual cterm=reverse ctermbg=NONE ctermfg=NONE
" shenanigans to force colors to invert (best guess is this setting is
" conflicting with file-specific settings from 'filetype plugin on'
autocmd ColorScheme * hi Visual ctermbg=DarkGrey ctermfg=NONE

" Create horizontal splits below the current file
"set splitbelow

" have netrw open new files in a new tab
let g:netrw_browse_split = 3 " Open in a new split

" remap 'vertical resize' command to something easier 
command! -nargs=1 Vr execute 'vertical resize' float2nr(&columns * <args> / 100)
  
" remap 'resize' command to something easier
command! -nargs=1 Hr execute 'resize' float2nr(&lines * <args> / 100)
  
" remap to open vimrc easily
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
  
" open the current file again in a split
nnoremap <leader>st :vsplit %<cr>

" open vertical splits to the right
set splitright 

" open help windows to the right
autocmd FileType help wincmd L

" remaps to make scrolling better
nnoremap j jzz
nnoremap k kzz

" remaps to make vertical jumps better
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz

" remaps to make search jumps better
nnoremap n nzz
nnoremap N Nzz

" remaps to make jumplist movements better
nnoremap <c-i> <c-i>zz
nnoremap <c-o> <c-o>zz

" make jump to bottom better
nnoremap G Gzz

" Set relative line numbers
set relativenumber
" Show absolute line number on cursor's line
set number
 
set ignorecase " ignore case when searching
set smartcase " respect case if search uses capital letter
set incsearch " turn on incremental search (highlighting during search)
  
set path+=** "search down into sub-folders when using ':find'. Provides
" tab-completion
 
command! MakeTags !ctags -R . " Create function to create 'tags file
" (may need to install ctags first)

set wildmenu " turn on menu for fuzzy file finding

" Tweaks for Netrw browsing
let g:netrw_banner = 0 " disable annoying banner at top
" let g:netrw_browse_split = 3 " 3 = opens new tabs in a new vim tab. 2 = split
" screen on new tab, 4 = replace previous screen with new tab
let g:netrw_liststyle = 3 " Tree view
let g:netrw_altofile = 0 " Prevents vim from focusing on opened split file
let g:netrw_altv = 0
  
" Go to tab by number
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
 
 
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
  
" Map <leader>sk to call code above snippet function with input from this line
nnoremap <leader>sk :call InsertSkeletonFile(input('Enter filetype:'))<CR>
