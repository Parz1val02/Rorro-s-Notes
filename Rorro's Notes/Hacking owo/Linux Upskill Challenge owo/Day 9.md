#Linux 
### Diving into networking
- ss -> "socket status"
	 `ss -lntp` 
- nmap -> "network mapper"
	`nmap localhost`
#### ufw -> uncomplicated firewall
*List of firewall rules in place:* `sudo iptables -L`
`sudo ufw allow (service or port)`  
`sudo ufw deny (service or port)`
	an specific ip or address range can be configured too
`sudo ufw enable`: start up the firewall
`sudo ufw disable`: shut down the firewall
`sufo ufw status`: status of the firewall rules

nestat and ss are **very much alike**

##### It is very important to allow access to ssh with ufw. The very first command has to be an explicit allow rule for ssh in order to not get locked out of the server