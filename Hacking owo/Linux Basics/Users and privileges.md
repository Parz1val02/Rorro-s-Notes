
r : read

w : write

x : execute

drwxr-xr-x

A d at the beginning means it's a directory

A - at the beginning means it's a file

A l at the beginning means it´s a sim link or soft links, these files point to other locations in the system

3 groups, each with different permissions

1st group, owner

2nd group, permissions for members of the group that own the file and can access it

3rd group, any other user

Change mode: chmod +rwx (or each one separated)

```
               chmod 777 (gives you read,write,execute for everyone) or +x
```

Add new user: adduser

deleteuser: userdel -r

/etc/passwd

/etc/shadow : stores passwords in hashes. Contains information about the systems, usesrs and passwords

switch user: su

sudo su -: switches the user to the root user

passwd: changes password

sudo (super user do): authorizes actions depending if the user is in the sudoers file located in /etc/sudoers

getent group sudo

