#Linux 

#### Scheduling events to run on an automatic basis
*cron* daemon: This daemon checks the cron table for which commands to run at specified times. We can alter the crontable to schedule a task or job to execute regularly on a particular day or date, at a particular time daily, or every so many weeks or months

	/etc/crontab -> cron table file

	crontab -e -> run this command to edit the cron table file

#### Crontab Shortcuts 
The crontab file has some built-in shortcuts you can use instead of a specifying the time, day, and month every time. These include the following: 
@yearly 
@annually 
@monthly 
@weekly
@daily 
@midnight 
@noon 
@reboot

#### Using RC scripts
Whenever you start your Linux system, a number of scripts are run to set up the environment for you. These are known as the rc scripts. After the kernel has initialized and loaded all its modules, the kernel starts a daemon known as init or init.d. This daemon then begins to run a number of scripts found in ***/etc/init.d/rc***. These scripts include commands for starting many of the services necessary to run your Linux system as you expect

***Linux Runlevels***
Linux has multiple runlevels that indicate what services should be started at bootup. For instance, runlevel 1 is single-user mode, and services such as networking are not started in runlevel 1. The rc scripts are set to run depending on what runlevel is selected: 
0 Halt the system 
1 Single-user/minimal mode 
2–5 Multiuser modes 
6 Reboot the system

***Adding Services to rc.d***
You can add services for the rc.d script to run at startup using the update-rc.d command. This command enables you to add or remove services from the rc.d script

	update-rc.d <name of the script or service> <remove|defaults|disable|enable>



