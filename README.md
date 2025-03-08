# .dotfiles

Are you an Isaiah from the future who forgot how to use his blazingly-fast system config?

Are you someone else who wants the blazingly fast speed you see from Isaiah's developemt?

Look no further, for here is the summary of how to use the system created by Isaiah's dotfiles.

## Quickstart
1) Clone this repo
2) `cd ~/.dotfiles`
3) Use `stow` + the name of the folder you want to copy to your system. For example, `stow vim`. This will place symlinks in your system that point to the config files you `stow`ed.

Assuming you have stowed the appropriate files for an aplication, all you should need is a restart of the application for the config files to take effect.

## Keybinds/Configs for Each Program

All configs should be default unless otherwise noted.

### i3
`Win` key is mod.  
`mod + enter` opens a terminal.  
`mod + d` opens search to other applications.  
`mod + (homerow numbers)` change workspaces.  
`mod + shift + q` closes the current window.  
`mod + shift + `homerow number)` moves the current focused screen to the number's workspace.  

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
