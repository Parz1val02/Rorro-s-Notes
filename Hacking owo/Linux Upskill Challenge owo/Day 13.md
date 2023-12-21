#Linux 
### Who has permissions?
To change permissions use the `chmod` utility
>If you are owner of a file, you can override the permissions, for example, overriding the write permission if you do not have them :w!

u -> user
g -> group
o -> other
a -> all (user+group+other)
+- rwx
421
rwx
##### Sticky bit (1)
The sticky bit can be added on world-writable directories to prevent users from deleting other users file
##### Setuid (4)
Allows an executable to always run as its owner
##### Setgid (2)
Allows an executable to always run as its group owner

>Find files with suid under root	
`find / -user root -perm -4000 2>/dev/null`

#### Groups
*To see what group your user is a part of type `groups`*
The `adm` group allows to view the contents of /var/log 

Add a user to a group: `usermod -a -G group user`

#### umask
The umask represents the values that are substracted from the default permissions for files and directories
Directories -> 777
Files -> 666
umask normal user -> 0002
umask root -> 0022
THe first bit in the umask is the sticky bit

#### chown
`chown NewUser:NewGroup file`

#### Linux Access Control lists
[Intro to ACL's](https://www.redhat.com/sysadmin/linux-access-control-lists)