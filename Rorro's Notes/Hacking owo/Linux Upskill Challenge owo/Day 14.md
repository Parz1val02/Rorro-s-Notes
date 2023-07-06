#Linux 
### Users and groups
`sudo adduser username`
`sudo addgroup group_name`j
`sudo delgroup group_name`
`sudo deluser username`
`sudo passwd username` -> manually change the password
`sudo usermod -a -G group username` -> manually add a user to a group
`sudo groupmod`
>Info about users: /etc/passwd and /etc/shadow
>Info about groups: /etc/group
>adduser is a friendly front end to the low level tool useradd	
> You can add and delete users from groups with adduser and deluser
> `sudo adduser username group_name`
> `sudo deluser username group_name`

*To view users's groups:
`groups (username)`
`id (username)`
`id -gn (username)`: primary group*

*To view group's users:
`getent group group_name`
`members group_name`
`grep '^group_name:.*$*' /etc/group | cut -d: -f4`*

#### /etc/sudoers
>Use `visudo` to edit /etc/sudoers

[Sudoers file](https://centoshelp.org/security/sudo-an-advanced-howto/)

*Interesting*
[Restricting shell access with nologin](https://www.cyberciti.biz/tips/howto-linux-shell-restricting-access.html)
[usermod tutorial](https://linuxhandbook.com/usermod-command/)