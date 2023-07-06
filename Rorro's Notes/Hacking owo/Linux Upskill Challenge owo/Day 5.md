#Linux 
### More or less... 
Viewing files with less instead of vim, less doesn't require to load the whole file before viewing
[less tutorial](https://www.thegeekstuff.com/2010/02/unix-less-command-10-tips-for-effective-navigation/)
*history command:* 
$HISTFILESIZE: number of commands kept in the history file
$HISTSIZE: number of commands kept in memory for the current session
To repeat a command that appears in the history command list, simply type `!(number of line)`
`!!`:re-execute the last command that was typed
`Ctrl + r`, `Ctrl + s`: handy way of autocompleting past commands in your prompt
>stty -ixon -> disables Ctrl+s to freeze the terminal. TO unfreeze use Ctrl+q
>sudo !! == !sudo

`Ctrl + p`: move backwards in command history
`Ctrl + n`: move forward in command history
`ALT+SHIFT+.`: get back to an empty prompt
`ALT+SHIFT+,`: jump to the first line of your command history
`Ctrl + a`: moves cursor to the beginnig of the line
`Ctrl + y`: paste from the clipboard
`Ctrl + l`: clear terminal screen
[Bash history commands and expansions, advanced wea](https://www.digitalocean.com/community/tutorials/how-to-use-bash-history-commands-and-expansions-on-a-linux-vps)
[Keyboard shortcuts bash terminal](https://www.makeuseof.com/linux-bash-terminal-shortcuts/)
[Useful dot files for the future](https://www.thegeekyway.com/what-are-dotfiles/)