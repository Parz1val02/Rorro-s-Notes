#Linux 
### Power trip!
>Interesting stuff in /var/log/auth.log, any use of sudo is logged here
>Use command | sudo tee (-a to append or overwrite by default) /root/somefile to redirect output 
>sudo $SHELL -c "command to pass"

-> Requires root password:
*su*
-> Requires $USER password:
*sudo su* 
*sudo -s* 
*sudo su -* 
*sudo -i* -> preferred way to gain root access
[Good forum if ever confused](https://unix.stackexchange.com/questions/35338/su-vs-sudo-s-vs-sudo-i-vs-sudo-bash)

init 0 -> halt
init 6 -> restart

>hostnamectl to rename a server
>datetimectl to change the time zone

[Hardcore ssh hardening](https://medium.com/@jasonrigden/hardening-ssh-1bcb99cd4cef)