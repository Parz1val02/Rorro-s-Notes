### Commands
##### Prefix -> `ctrl+b`
---
#### Panes
Split the terminal vertically -> `prefix + "`
Split the terminal horizontally -> `prefix + %`
Kill a pane -> `prefix + x` or `exit`
Switch between horizontal or vertical split -> `prefix + space`
Switch two panes with one another -> `prefix + {` or `prefix + }`
Move between panes -> `prefix + arrow keys`
Anti clock wise rotation of the panes -> `prefix + ctrl + o`
Another way to move to the next pane -> `prefix + o`
Zoom in and zoom out of a pane -> `prefix + z`
#### Windows
Rename window -> `prefix + ,`
Create a new windows -> `prefix + c`
Return to previous window -> `prefix + p`
Move to next window -> `prefix + n`
General switching between windows -> `prefix + window_name`
Break the current pane out of the window and moves it to a new window -> `prefix + !`
Join panes on different windows -> `prefix + :` and then `join-pain -s source -t to`
Swap different windows -> `prefix + :` and then `swap-window -s source -t to`
#### Sessions
Detach a session -> `prefix + d`
List active sessions -> `temux ls`
Reattach to a session -> `temux attach -t session_name`
Rename a session -> `tmux rename-session -t session_name new_session_name`
Create new session with a name -> `tmux new -s session_name`
Delete a session -> `tmux kill-session -t session_name`