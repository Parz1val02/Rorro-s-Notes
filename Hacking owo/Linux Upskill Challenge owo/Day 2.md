#Linux 
Useful ls switches:
*-a*
*-l*
*-r*: reverse order while sorting
*-t*: sort by modification time, newest first
*-R*: lists files recursively
*-h*: human readable file size

### Basic Navigation
- `cd` moves you to your home directory
- `cd ~` == `cd $HOME`
- `cd -` moves you to the last visited directory, `cd -` == `cd $OLDPWD`
- [pushd and popd](https://opensource.com/article/19/8/navigating-bash-shell-pushd-popd) -> for bash and zsh shell

### Interesting stuff for today
- [PS1 bash shell](https://www.thegeekstuff.com/2008/09/bash-shell-ps1-10-examples-to-make-your-linux-prompt-like-angelina-jolie/)
|Special characters|value|
|:---:|:---:|
|\\u|user|
|\\h|hostname|
|\\w|full dir path|
|\\s|shell|
|\\n|new  line|
|\\d|date|
|\\W|current dir|
|\t|time|

- `printenv` prints all environment variables
- `apropos <string to search>` -> wiki for commands
- `tldr` -> too long didn't read 