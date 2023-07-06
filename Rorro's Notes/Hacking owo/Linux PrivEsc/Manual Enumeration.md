#LinuxPrivEsc

#### Commands
`lsb_release -a`
`hostname` -> hostname of target machine, may provide info about the system's role in the corpo network
`uname -a` -> system info, such as kernel version
`ps` 
	`-A` -> View all runnig processes
	`axjf` -> View process tree
	`aux` -> Show processes for all users (a), display the user that launched the process (u), show processes atatched to a terminal (x)
`env` -> show all environment variables
`sudo -l` -> lists all commands the current user can run with sudo
`ls -la` -> show hidden files or directories
`id` -> provide a general overview of a user's privilege level and group memberships
	`id user` -> can also see info on other users
`history` -> may store some info 
`ifconfig` -> the system may be a pivoting point to another network
`ip route` -> view existing network routes

#### System files
`/proc/version` -> This filesystem provides info about the processes. May also give info about the kernel version and data such as programs installed (gcc compiler for example)
`/etc/issue` -> info about the system
`/etc/passwd` -> discover other users on the system
	`cat /etc/passwd | cut -d":" -f 1`
	`cat /etc/passwd | grep home`

#### netstat 
	`-t` or `-u` -> list by TCP or UDP
	`-a` -> all listening ports and established connections
	`-l` -> ports in listening mode
	`-s` -> lists network usage statistics by protocol
	`-p` -> include service name and pid info
		if the column "PID/Program name" is empty, it means it's run by another user
	 `-i` -> view interface statistics
	`-n` -> do not resolve names
	`-o`  -> display timers

#### find
	`find / -user root -perm -4000 2>/dev/null`
	`find / -perm -u=s -type f 2>/dev/null`