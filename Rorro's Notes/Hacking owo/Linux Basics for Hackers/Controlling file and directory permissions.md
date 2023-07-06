#Linux 
rwx - read, write, execute

### Granting ownership to an individual user
*change owner command* : **chown**  
Moves the ownership of a file to a different user

	chown user (location_of_the_file)

### Granting ownership to a group
*change group command* : **chgrp**  
Moves the ownership of a file to a different group

	chgrp group (location_of_the_file)

### Checking permissions 
	ls -l  for long description
	ls -a  for hidden files or directories
	ls -n for user ids xdd

### Changing permissions
*change mode* command: **change mode**
Changes permissions of a file. Only the root users or the file´s owner can change them

#### With numeric notation
| Binary | Octal | RWX |
|--------|-------|-----|
|  000   |   0   | --- |
|  001   |   1   | --x | 
|  010   |   2   | -w- |
|  011   |   3   | -wx |
|  100   |   4   | r-- |
|  101   |   5   | r-x |
|  110   |   6   | rw- |
|  111   |   7   | rwx |

	FOR EXAMPLE: granting all permissions to all users is chmod 777

#### With UGO  (symbolic notation)
-u : this flag represents user or owner
-g : this flag represents group
-o : this flag represents others or everyone else
-Removes a permission 
+Adds a permission 
=Sets a permission

	chmod (u/g/o) (-/+/=) (r/w/x) file

**Important**: by default, Linux automatically assings all files and directories permissions of 666 and 777, respectively 

### umask method
The umask method represents the permissions you want to remove from the base permissions on a file or directory to make them more secure
The umask is a three-digit decimal number corresponding to the three permissions digits, but the umask number is subtracted from the permissions number to give the new permissions status

	| New Files | New directories |  |
	|-----------|-----------------|--|
	|  666   |   777   | Linux base permissions |
	| -022   |  -022   | umask | 
	|  ---   |   ---   | --- |
	|  644   |   755   | Resulting permissions |

In Kali, as with most Debian systems, the umask is preconfigured to 022, meaning the Kali default is 644 for files and 755 for directories.
The umask value is located in /home/username/.profile


### Special permissions
The linux special permissions are set user ID (or SUID), set group ID (or SGID), and sticky bit

#### SUID
The SUID bit says that any user can execute the file with the permissions of the owner but those permissions don’t extend beyond the use of that file 
To set the SUID bit, enter a 4 before the regular permissions

	chmod 4??? file

#### SGID
SGID also grants temporary elevated permissions, but it grants the permissions of the file owner’s group, rather than of the file’s owner
The SGIDbit is represented as 2before the regular permissions

	chmod 2??? file/directory

#### Sticky bit 
The sticky bit is a permission bit that you can set on a directory to allow a user to delete or rename files within that directory


### Privilege escalation with SUID

	find / -user root -perm -4000

