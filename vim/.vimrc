let mapleader = "'" "leader for plugin and user-defined shortcuts.
" Don't want to conflict with i3, tmux, vim

set tabstop=4 " make tabs appear as 4 spaces in vim (defualt is 8)

"set indicator for line length of 80
set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey

" Create horizontal splits below the current file
"set splitbelow
  
" remap 'vertical resize' command to something easier 
command! -nargs=1 Vr execute 'vertical resize' float2nr(&columns * <args> / 100)
  
" remap 'resize' command to something easier
command! -nargs=1 Hr execute 'resize' float2nr(&lines * <args> / 100)
  
" remap to open vimrc easily
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
  
" open the current file again in a split
nnoremap <leader>et :vsplit
 
" open a terminal below all splits
nnoremap <leader>term :term<cr><c-w>J<c-w>:Hr 25<cr>

" open vertical splits to the right
set splitright 
  
" remaps to make vertical movement easier
nnoremap <c-d> <c-d>zz
nnoremap <c-u> <c-u>zz
  
" remaps to make searching easer on the eyes
nnoremap n nzz
nnoremap N Nzz

" remaps to make scrolling better
nnoremap j jzz
nnoremap k kzz

nnoremap G Gzz
" Set relative line numbers
set relativenumber
 
" Show absolute line number on cursor's line
set number
  
" turn auto-indenting on
set autoindent
  
" text wrapping options I don't understand. Still not working either:
set wrap
set linebreak
set breakindent
  
set ignorecase " ignore case when searching
set smartcase " respect case if search uses capital letter

set incsearch
  
set nocompatible " Tell vim not to pretend to be vi
  
syntax enable " Enable some syntax highlighting
  
filetype plugin on " *look up what this does*
  
set path+=** "search down into sub-folders when using ':find'. Provides
" tab-completion
  
command! MakeTags !ctags -R . " Create the 'tags file (may need to install
" ctags first)
  
set wildmenu " turn on menu for fuzzy file finding
  
" Tweaks for Netrw browsing
let g:netrw_banner = 0 " disable annoying banner at top
" let g:netrw_browse_split = 3 " 3 = opens new tabs in a new vim tab. 2 = split
" screen on new tab, 4 = replace previous screen with new tab
let g:netrw_liststyle = 3 " Tree view
let g:netrw_altofile = 0 " Prevents vim from focusing on opened split file
let g:netrw_altv = 0
  
" Following are useful when trying to do mutliple windows/screen
" let g:netrw_winsize = 80 " change default netrw window open size
  
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
  
 " Function to customize netrw's behavior when opening files
  function! NetrwOpenBehavior()
    " Get the number of windows in the current tab
    let wincount = winnr('$')
  
    " If there is only one window and it's netrw, open the file in a new tab
    if wincount == 1  && &filetype == 'netrw'
      let g:netrw_browse_split = 2 " Open in a new split
    " If there are two windows, open the file in the non-netrw split
    elseif wincount >= 2  && &filetype == 'netrw'
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
  
" Map <leader>sk to call code above snippet function with input from this line
nnoremap <leader>sk :call InsertSkeletonFile(input('Enter filetype:'))<CR>
  
" Insert epic ascii art when Vim is opened
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@%@@@@@@@*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@++=%%%@@@@=--+=@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=-:::=:+:---=%--@*##-+:*=%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@-:=++-+%#+--##%@:=-=+*@@#=@+==-%@@@@@@@@@@@@@@@@@@@+@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@#+*-=%%:%%@%#+*@+:.:#@@@*@#@@%+-++:+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@%@@@@@@@@@@@@@@@@@@@%%=-..==*:*=-*%@@@@@@#%=%#%%*%*@.%%=++*@@@#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@+:-+---:*#.+*#*@@@%#..#@@%=--+-#=@%+=#@-+@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@%@@@@@%@-+:=::-*.::+@*@@@**%#%*=-==:-=+=*@-%@+:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#@"
echo "@@@@@@@@@@@@@@@@@@@@@@@*+-++=--=-*#++@.@@+*+-::..::---==-%@@@@@@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@%*-:**=:+#%+%=%:#++=-::::..:=---++*%%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@%@@@@@@@@@@@@++==--:###%-::.+*:=-:::::.:----+=+*#+%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@%+=#+-=-*@%-*#*==--::::::::::---=+*%@:@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@#%=*:%:-*:%-%*-:::::::::..:::::-+*###@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@#%%%%=-=+%%*+-:::::-::-.:::::+*%#*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@%@*@%#--*:.::-:-*-::+%+%%@%%%%##+%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@*.#-::---=-##@##:.:=*+--==++==+#@*@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.=+.---#*:+---*:..=+=**=--=-=*#@#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#+::...-::=.::..-*+=-::--:=+#@*+@@@@@@@@@@@@@%@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:::........::..:*==--:-===*%@--@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.::.......:::=##@%==::--+++*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.::::....:=..::=%%%+-::==+*%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@.::....::.=*-*++%%##*--=**#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@-::..:.==*%##@@@@@@@-+**%@#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@::...-#**-::*#*++==-*##%@#.@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@:..:@+===*----+-++*+*%@%+.+@@@@@@@@@@@@@@@@@@@@@@%@@@@@@@@@@@@@"
echo "@%@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@::-:-:::.::-=--+%%%%@@::-#@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@--==+:::-=--=+=%%%@@@=...@@@@@@@@@@%@@@@%@@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@#+..:#-+%***###@%%%@@*:..=-@@@@@@@@@@@@#@%#%@@@@@@@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@+*=+#....+*#+-=-+%@@@@+-::.*.=@@@@@@@@%@@%*%#%%@##**#@@@@@@@@@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@=-*-*+#%........@@@@@#*-:.:..-..%@@@@@@@@@@%@#%%#%%##%*+#+**++#%@@@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@@@@+=**#**-+%%+.......%#%@@@.......-.-#@#@%##%@@@@@@@*#%%%@*+####***#=+*#@@@@"
echo "@@@@@@@@@@@@@@@@@@@@@@@=+***#%+*=+-:@+.....%+*%#%@@@....:..###%@%%#%#%@@@#%*@@+##%**=**###+**++*##@%"
echo "@@@@@@@@@@@@@@@@@@@@=++--+###+*=-%+*@-*=.==..#*@@@.......=##%+@%*%*%#=@@@@###%%#%**##**@#-*#=+*#*##@"
echo "@@@@@@@@@@@@@@@@@-==++=++=++##++=*=#@:=+-*..**@@@=#%...*+++%+%%#*##%#+*#*+#++*#%#**=**+@*=%#++++*#%%"
echo "@@@@@@@@@@@@@@:*-+#==+-*=#*=*+=+=*#@#*==+==*#*@@*%@@%+++-=**-%##%***=%+=#@%+#*#*#%***#*@*#+++==**%#*"
echo "@@@@@@@@@@@@@-=:+++=*=#%+#=*=+@#-=%@@:#+-++=%##@@%%*:*=#%%-**###*+++%*##*%@@***=#**+***%%%+=-=++*###"
echo "@@@@@@@@@@@@+:-=@=*===+=*++=+-*+::@@@#*==*===:%#%*++=+%#*+#++#%%#**=%+*#@@##****%%*#+=#%%%*==+*=-%#*"
echo "@@@@@@@@@@@:+++-+-+==-*-++-+*+#+=+@@#-++*-:*=++-+-=**-*+#@*+%%*#*#***+#@@#**#-*@%#%*++#%@#*-#*--#%#*"
echo "@@@@@@@@@@:--+*-+++++====-=#=*#*+-%@*--==+=*#+-=*+-**#=%++=-@%**=+*+-=@*%%*#*#=*#@%@++##@@**@==+%#*+"
echo "@@@@@@@@@@==+=-*#*=**==+*+++=+=+=%@+---+-+-@=+-=+=:+##*+===*@#*++=**@#%%%##=+****@%@*+=%@@=@+==##++*"
echo "@@@@@@@@@-=-=+*+**-=-***#==-+**+=#@:*%=@=--+=--:-=++*+==-==#%***=*#%+*@*%#+#+%+%*%@@%+#%@@%#+--#####"
echo "@@@@@@@@@-+=*+**#=-+==*==+===+==*@#++-+--:-+-+%+=#+=+:::+==+#+###@%+=*%%#%#+**#%#%*@@-*@@@@++=+#*%%#"
echo "@@@@@@@@-=++=-#+#=-+=**+++*==+-*#@++:-+:++===:==-+=-:+--=-=#***@@%*=-##*%##%%*#%%#%@@%=%@@%#===#%%*+"
echo "@@@@@@@@:=--=+%+#-*=+=*++=+==+-+@#=+=-++-=:-==--+-=:=:-=--=*+@@@%*+=*+%#*#%**#*#%@%#@@+%@@%++=##+==+"
echo "@@@@@@@@=*==:%#**=++=+==+#+==:-*@*:+=-===:=-=-++--++**==-:==@@%%*%*##+#%#*#%@*%#@@@@@@%#@@@#+===-+++"
echo "@@@@@@@-=+=+*#=+*::==+-*+=:==-=%@+--+-+-==-=+##=+==-==-+--@@@%#%+#*=**%###@*#*+%%%@#%@%%@@@*+=-+++*+"
echo "@@@@@@@:++:#%-**#--++:++*==-:=+@%+++-===--==-=-=-*-==----=@%###***##+**#%+#%%%#%@%@%@%@@@@%%@%+*%##+"
echo "@@@@@@@-+-%*%@%**=-=+-=*+===-:=@*+-+=-=:----=--=--==-*-............+++**###%%%##@@@%@@@@@@@@@==#*+-+"
echo "@@@@@@:=#++%#@@%=-+-+--++=-==-%@+====+=--+-+--+-=+................ ..**%*##%%%%##@%@@@@%@@@@*+*+==*#"
echo "@@@@@*==#-+%@%%*+-+=+=-=+=-=-=%@+=++-*+--==+*=+-....:-=+*##=...  ....:.=##%#%%%#%@%@@@@@@@@%+*+=+%@%"
echo "@@@@@===*++%###@#=#+===-=+--=+@@*+=====::--.*.==+*+=:##:... ..........:::=#%%#***#**#%#@%%@###*+#*+-"
echo "@@@@:--+=+#%@@@@%==+---+-=-+-+@@#+=+=------::::---.=##......:-**.    .::::.**#+*=#*+*+**++#+=+=====-"
echo "@@@#--#*#==%@@*@=-===+--=+=-=+@@+=-==-=:=+-=--+++=.-+=..-%@+.. . ..  ..::::.:##**#*#*#***#**=*+:===-"
echo "@@@-==+-+:=%@@@@:==---+-+-=+==@@==-:----:--=++-....-=*=*=:.....*-..   .-.::::*##++*+****+##++**=-=+-"
echo "@@-===+=-*=#%#%@:-+===:=---=+*@@*+-==-=-::=+==+-.****#%-:..-:=. .....:-=:::::.*%++*+*+#*##***+*+=++="
echo "@%:-+-+=++*##+@@:==+=--==-+++%@@**==+==----.+.+-+===+..:-*%......:--==++----=-=*#**+*++**#**==**=+++"
