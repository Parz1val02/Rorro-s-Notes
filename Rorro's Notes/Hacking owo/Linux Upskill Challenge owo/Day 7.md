#Linux 
### The server and its services
`python -m http.server (port number)`
#### Apache 2
`sudo systemctl start apache2`
`sudo systemctl stop apache2`
`systemctl status apache2`
>Main config file: /etc/apache2/apache2.conf
>Location of default web page: /etc/apache2/sites-enabled/000-default.conf
>Code of default page: /var/www/html/index.html
>Logs -> /var/log/apache2/access.log
>	-> /var/log/apache2/error.log

#### Systemctl
Service management tool provided by systemd
##### Start a service:
`sudo systemctl start application.service`
##### Stop a service:
`sudo systemctl stop application.service`
##### Restart a service:
`sudo systemctl restart application.service`
##### Reload a service: reload config files without restart
`sudo systemctl reload application.service`
>Not all services possess the functionality to reload
>reload-or-restart, reloads first if available, if not just restart
>`sudo systemctl reload-or-restart application.service`
##### Enable a service
`sudo systemctl enable applicatoin.service`
##### Disable a service
`sudo systemctl disable applicatoin.service`
*status tambien owo*
[Systemctl guide](https://www.digitalocean.com/community/tutorials/how-to-use-systemctl-to-manage-systemd-services-and-units)