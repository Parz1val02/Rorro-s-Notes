#Linux 
### Log rotation
#### logrotate
>/etc/cron.daily/logrotate: shell script that executes the logrotate command everyday
>/etc/logrotate.conf: Log rotation configuration for all the log files are specified in this file
>/etc/logrotate.d: When individual packages are installed in the system, they drop the log rotation configuration information in this directory

[logrotate examples](https://www.thegeekstuff.com/2010/07/logrotate-examples/)
[logrotate tutorial](https://www.linode.com/docs/guides/use-logrotate-to-manage-log-files/)

*journalctl*