#LinuxPrivEsc 
SUID (Set-user Identification) and SGID (Set-group Identification) -> These allow files to be executed with the permission level of the file owner or the group owner, respectively

`find / -type f -perm -04000 -ls 2>/dev/null` will list files that have SUID or SGID bits set.
`find / -user root -perm -4000 2>/dev/null`
[https://gtfobins.github.io/](https://gtfobins.github.io/) is a valuable source that provides information on how any program, on which you may have a SUID bit set, can be used

#### Nano
Nano does not have an SUID entry on gtfobins pipipi
There are two basic options for privesc:
- /etc/shadow
- /etc/passwd
Exfiltrate the files to the attacking machine
Use *unshadow* to create a file uncrackable by Jhon the ripper
`unshadow passwd.txt shadow.txt > passwords.txt`
The *unshadow technique basically works with anything that allows to read /etc/passwd*

Another option is to create a new user that has root privileges
![[NANOSUID.JPG]]
When adding the user to /etc/passwd, the last three parameters must be the same as the ones from root
`root:/root:/bin/bash`
`su` into the new user and voila