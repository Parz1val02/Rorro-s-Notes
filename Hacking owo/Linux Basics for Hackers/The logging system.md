#Linux 
Log files store information about events that occur when the operating system and applications are run, including any errors and security alerts

#### The Rsyslog logging daemon
Like nearly every application in Linux, rsyslog is managed and configured by a plaintext configuration file located, as is generally the case in Linux, in the /etc directory.

	/etc/rsyslog.conf -> configuration file for rsyslog

#### Rsys logging rules
The rsyslogrules determine what kind of information is logged, what programs have their messages logged, and where that log is stored

	facility.priority      action

- facility:
	The facility keyword references the program, such as mail, kernel, or lpr, whose messages are being logged. The priority keyword determines what kind of messages to log for that program. The action keyword, on the far right, references the location where the log will be sent.

	The following is a list of valid codes that can be used in place of the facilitykeyword in our configuration file rules: 
	
	auth/authpriv   Security/authorization messages 
	cron                  Clock daemons 
	daemon            Other daemons 
	kern                  Kernel messages 
	lpr                     Printing system 
	mail                   Mail system 
	user                   Generic user­level message

- priority:
	The priority tells the system what kinds of messages to log. Codes are listed from lowest priority, starting at debug, to highest priority, ending at panic. When you specify a priority, messages of that priority and higher are logged

	Here’s the full list of valid codes for priority: 
	debug 
	info 
	notice 
	warning 
	warn 
	error 
	err 
	crit 
	alert 
	emerg 
	panic

- action:
	The action is usually a filename and location where the logs should be sent. Note that generally, log files are sent to the /var/log directory with a filename that describes the facility that generated them

#### AUTOMATICALLY CLEANING UP LOGS WITH LOGROTATE
Log rotation is the process of regularly archiving log files by moving them to some other location, leaving you with a fresh log file. That archived location will then get cleaned up after a specified period of time.

	/etc/logrotate.conf -> configures the logrotate utility to choose the regularity of your log rotation

#### Remaining stealthy in linux
#1 Shred the logging files: the *shred* command will delete the file and overwrite it several times—by default, shred overwrites four times.

	shred -f -n 10 /var/log/auth.log.*
	-f: changes the permissions on the files to allow overwriting if a permission change is necessary
	-n: lets you choose how many times to overwrite the files

#2 Disable logging: This option requires root privileges. One could simply stop the rsyslog daemon

	service servicename start|stop|restart

To stop the logging daemon:

	service rsyslog stop
