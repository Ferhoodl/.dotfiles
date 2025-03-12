# .dotfiles

Are you an Isaiah from the future who forgot how to use his blazingly-fast system config?<cr>

Are you someone else who wants the blazingly fast speed you see from Isaiah's developemt?<cr>

Look no further. Here lie the secrets:<cr>

## Quickstart
1) Clone this repo into ~/ (id est: `cd ~/`, and `git clone https://github.com/Ferhoodl/.dotfiles.git`).<cr>
2) cd into .dotfiles/ (`cd ~/.dotfiles/`).<cr>
3) Use `stow` + the name of the folder you want to copy to your system. For example, `stow vim` and press enter. This will place symlinks of vim config files into your system. Symlinks are like windows shortcuts that point to the config files you cloned and `stow`ed.<cr>

Assuming you have stowed the appropriate files for an aplication, all you should need is an application restart for the config files to take effect.<cr>

## Keybinds/Configs for Each Program<cr>

Some of these are defaults. Some are custom.<cr>

### i3
`Win` key is mod.<cr>
`mod + enter` opens a terminal.<cr>
`mod + d` opens search to other applications.<cr>
`mod + (homerow numbers)` change workspaces.<cr>
`mod + shift + q` closes the current window.<cr>
`mod + shift + homerow number)` moves the current focused screen to the number's workspace.<cr> 

### Vim
`'` is leader.<cr>
`leader + ev` opens .vimrc in a split.<cr>
`leader + et` opens current file in a split.<cr>
`leader + term` opens a terminal under all open splits (finnicky).<cr>
`ctrl-w + (h,j,k,l)` changes focus on vim panes.<cr>
`ctrl-w + : + Vr + (number)` adjusts the current window to (number)% of the vertical vim screen.<cr>
`ctrl-w + : + Hr + (number)` adjusts the current window to (number)% of the horizontal vim screen.<cr>

### Tmux
`ctrl-b` is leader.<cr>
#### Sessions
~$`tmux new -s (session name)` creates new tmux sesison.<cr>
`new -s (session name)` creates new tmux session.<cr>
`leader + d` detaches from tmux session.<cr>
`leader + $` renames the current session.<cr>
`leader + "` opens a split pane below.<cr>
`leader + %` opens a split pane to the right.<cr>
`leader + x` closes the current pane.<cr>
`leader + alt-(arrow keys)` adjusts pane sizes.<cr>
`leader + {` moves current pane to the left.<cr>
`leader + }` moves the current pane to the right.<cr>

### GDB
***compile with -d flag to generate debut information in executable for gdb***<cr>

##### Layout commands
`gdb *executable*`  while in terminal opens executable in gdb. Ex: `gdb main` to open main.<cr>
`layout next` cycles through gdb layouts. Layouts are `src` -> `asm` -> `split` -> `register` -> `src`.<cr>
`layout src` opens the src layout directly. Same works for `asm`, `split`, `register`, etc.<cr>
`ctrl-l` repaints the screen (useful for when printfs happen. gdb can't handle that for some reason).<cr> 

##### Debugging commands
`run` runs the program straight through until breakpoint, crash, or termination.<cr>
`start` begins running the program but waits for the user to command direct instruction.<cr>
`next` goes to the next source instruction, walking over function calls.<cr>
`nexti` goes to the next assembly instruction, walking over function calls.<cr>
`step` goes to the next assembly instruction, but steps down into function calls.<cr>
`stepi` goes the next assembly instruction, but steps down into function calls.<cr>
