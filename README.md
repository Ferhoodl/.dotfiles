# .dotfiles

Are you an Isaiah from the future who forgot how to use his blazingly-fast system config?

Are you someone else who wants the blazingly fast speed you see from Isaiah's developemt?

Look no further. Here lie the secrets:

## Quickstart
1) Clone this repo into ~/ (id est: `cd ~/`, and `git clone https://github.com/Ferhoodl/.dotfiles.git`).
2) cd into .dotfiles/ (`cd ~/.dotfiles/`).
3) Use `stow` + the name of the folder you want to copy to your system. For example, `stow vim` and press enter. This will place symlinks of vim config files into your system. Symlinks are like windows shortcuts that point to the config files you cloned and `stow`ed.

Assuming you have stowed the appropriate files for an aplication, all you should need is an application restart for the config files to take effect.

## Keybinds/Configs for Each Program

Some of these are defaults. Some are custom.

### i3
`Win` key is mod.  
`mod + enter` opens a terminal.  
`mod + d` opens search to other applications.  
`mod + (homerow numbers)` change workspaces.  
`mod + shift + q` closes the current window.  
`mod + shift + homerow number)` moves the current focused screen to the number's workspace.  

### Vim
`'` is leader.  
`leader + ev` opens .vimrc in a split.  
`leader + et` opens current file in a split.  
`leader + term` opens a terminal under all open splits (finnicky).  
`ctrl-w + (h,j,k,l)` changes focus on vim panes.  
`ctrl-w + : + Vr + (number)` adjusts the current window to (number)% of the vertical vim screen.  
`ctrl-w + : + Hr + (number)` adjusts the current window to (number)% of the horizontal vim screen.  

### Tmux
`ctrl-b` is leader.  
`leader + d` detaches from tmux session.  
`leader + $` renames the current session.  
`leader + "` opens a split pane below.  
`leader + %` opens a split pane to the right.  
`leader + x` closes the current pane.  

### GDB
***compile with -d flag to generate debut information in executable for gdb***  

##### Layout commands
`gdb *executable*`  while in terminal opens executable in gdb. Ex: `gdb main` to open main.  
`layout next` cycles through gdb layouts. Layouts are `src` -> `asm` -> `split` -> `register` -> `src`.  
`layout src` opens the src layout directly. Same works for `asm`, `split`, `register`, etc.  
`ctrl-l` repaints the screen (useful for when printfs happen. gdb can't handle that for some reason).  

##### Debugging commands
`run` runs the program straight through until breakpoint, crash, or termination.  
`start` begins running the program but waits for the user to command direct instruction.  
`next` goes to the next source instruction, walking over function calls.  
`nexti` goes to the next assembly instruction, walking over function calls.  
`step` goes to the next assembly instruction, but steps down into function calls.  
`stepi` goes the next assembly instruction, but steps down into function calls.  
