#Linux 
#networking 
# Analyzing and managing networks
ifconfig
iwconfig: ifconfig for wireless networks

### Changing you IP address
	To change your IP address, enter ifconfig followed by the interface you want to reassign and the new IP address you want assigned to that interface.
	*ifconfig eth0 new_ip_address* (may need sudo to work)
	
### Changing you network mask and broadcast address
	You can also change your network mask (netmask) and broadcast address with the ifconfigcommand.
	*ifconfig eth0 new_ip_address netmask new_netmask broadcast new_broadcast_address* (may need sudo to work)
	
### Spoofing your MAC address
	To spoof your MAC address, simply use the ifconfig command’s down option to take down the interface (eth0 in this case). Then enter the ifconfig command followed by the interface name (hw for hardware, ether for Ethernet) and the new spoofed MAC address. Finally, bring the interface back up with the up option for the change to take place.
	* ifconfig eth0 down
	  ifconfig eth0 hw ether (spoofed MAC address)
	  ifconfig eth0 up *

### Assigning New IP Addresses from the DHCP Server
	*dhcpd*: DHCP daemon
	
	The DHCP server assigns IP addresses to all the systems on the subnet and keeps log files of which IP address is allocated to which machine at any one time
	
	To request an IP address from DHCP, simply call the DHCP server with the command dhclient followed by the interface you want the address assigned to. 
	
	*kali >dhclient eth0*
	
	The dhclient command sends a DHCPDISCOVER request from the network interface specified. It then receives an offer (DHCPOFFER) from the DHCP server  and confirms the IP assignment to the DHCP server with a dhcp request.

### Manipulating the Domain Name System
	DNS is the service that translates a domain name to the appropriate IP address; that way, your system knows how to get to it.
	
	*dig* is a useful command that offers a way to gather DNS information about a target domain. This information could include the IP address of the target’s nameserver (the server that translates the target’s name to an IP address), the target’s email server, and potentially any subdomains and IP addresses.
	
	*kali >dig (domain name) ns*     -ns stands for *nameserver*
	
	*kali >dig (domain name) mx*    -mx stands for *mail exchange server*

### Changing your DNS server
	To change your DNS server, change the /etc/resolv.conf file
	*nameserver (ip)*
	
### Mapping Your Own IP Addresses
	A file called the *hosts* file performs domain name - ip address translation
	*/etc/hosts* can be used to specify which ip address your browser redirects to when inputting certain domain name

	(ip)    (domain name)
	**MAKE SURE TO PRESS TAB AND NOT SPACE BETWEEN THE IP AND DOMAIN NAME WHILE EDITING /etc/hosts**

	/etc/network/interfaces -> static or dynamic ip addressing

Random network commands:
route ->tabla de rutas
host nombre_de_host (se puede especificar con que servidor realizar la consulta)-> información de un host a partir de un DNS
host -t (registro en específico) nombre_de_host -> info de un registro en específico
host -a nombre_de_host -> toda la info de los registros
ifconfig interface promisc
ifconfig interface -promisc
ifconfig interface arp
ifconfig interface -arp
dig nombre_de_host (@ip_servidor_a_usar)
