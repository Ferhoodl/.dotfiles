# .dotfiles

Are you an Isaiah from the future who forgot how to use his blazingly-fast system config?  

Are you someone else who wants the blazingly fast speed you see from Isaiah's development?  

Look no further. Here lie the secrets:  

## Quickstart
1) Clone this repo into the `~/` directory (id est: `cd ~/`, and `git clone https://github.com/Ferhoodl/.dotfiles.git`).  
2) cd into `.dotfiles/` (`cd ~/.dotfiles/`).  
3) Use `stow` + the name of the folder you want to copy to your system. For example, `stow vim` and press enter. This will place symlinks in your system that point to the vim config files you `stow`ed.  

Assuming you have stowed the appropriate files for an aplication, all you should need is an application restart for the config files to take effect.  

## Keybinds/Configs for Each Program  

Some of these are defaults. Some are custom.  

### i3
Windows key is mod.  
`<mod>enter` opens a terminal.  
`<mod>d` opens a searchbar for applications.  
`<mod>(homerow number)` change workspaces.  
`<mod><shift>q` closes the current window.  
`<mod><shift>(homerow number)` moves the current focused screen to the number's workspace.   
### Vim
`'` is \<leader\>.  
`<leader>ev` opens .vimrc in a split.  
`<leader>et` opens current file in a split.  
`<leader>term<CR>` opens a terminal under all open splits (finnicky).  
`<C-w>(h,j,k,l)` changes focus on vim panes.  
`<C-w>:Vr(number 1 to 100)<CR>` adjusts the current window to (number)% of the vertical vim screen.  
`<C-w>:Hr(number)` adjusts the current window to (number)% of the horizontal vim screen.  

### Tmux
`<C-b>` is \<leader\>.  

##### Sessions
~$`tmux new -s (session name)<CR>` creates new tmux sesison.  
`new -s (session name)` creates new tmux session.  
`<leader>d` detaches from tmux session.  
`<leader>$` renames the current session.  
`<leader>w` shows all sesisons, windows, and panes.
##### Windows
`<leader>c` creates new window.  
`<leader>,` renames current window.

##### Panes
`<leader>"` opens a split pane below.  
`<leader>%` opens a split pane to the right.  
`<leader>x` closes the current pane.  
`<leader>alt-(arrow keys)` adjusts pane sizes.  
`<leader>{` moves current pane to the left.  
`<leader>}` moves the current pane to the right.  

### GDB
***compile with -d flag to add debug information to executable for gdb***  
Ex: `gcc main.c -o main -g`

##### Layout commands
~$`gdb (executable)<CR>` opens executable in gdb. Ex: `gdb main` to open main.  
`layout next<CR>` cycles through gdb layouts. Layouts are `src` -> `asm` -> `split` -> `register` -> `src`.  
`layout src<CR>` opens the src layout directly. Same works for `asm`, `split`, `register`, etc.  
`<C-l>` repaints the screen (useful for when printfs happen. gdb can't handle that for some reason).   

##### Debugging commands
`run<CR>` runs the program straight through until breakpoint, crash, or termination.  
`start<CR>` begins running the program but waits for the user to command direct instruction.  
`next<CR>` goes to the next source instruction, walking over function calls.  
`nexti<CR>` goes to the next assembly instruction, walking over function calls.  
`step<CR>` goes to the next assembly instruction, but steps down into function calls.  
`stepi<CR>` goes the next assembly instruction, but steps down into function calls.  
`b (function name)<CR>` puts a breakpoint at the program.  
`b (function name)<CR>` puts a breakpoint at the beginning of (function name) function.  
`b (line number<CR>` puts a breakpoint at the (line number) line.  
`b<CR>` puts a breakpoint at the current line.  
`d (number)<CR>` deletes breakpoint number (number).  
`watch (variable name)<CR>` sets a watchpoint to (variable name).  
`disable (watchpoint number) disables watchpoint of number (watchpoint number).  
`bt<CR>` prints the stack trace.  
`f<CR>` runs until the function is finished.  

