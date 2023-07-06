#Linux 
#networking 
#### Wi Fi networks
	iwconfig ---- ifconfig only for wireless networks

Wifi modes:
- Managed: it is ready to join or has joined an access point 
- Master: it is ready to act as or already is an access point
- Monitor: 

	iwlist *interface action*
	iwlist wlan0 scan: scans for all the wifi access points available to connect to

*nmcli* command (network manager command line interface)
The Linux daemon that provides a high­level interface for the network interfaces (including the wireless ones) is known as the network manager
We use it in the format nmcli *dev network_type*, where dev is short for devices and the type (in this case) is wifi

	nmcli dev wifi

In addition to displaying the Wi­Fi APs within range and key data about them, including the SSID, the mode, the channel, the rate of transfer, the signal strength, and the security protocols enabled on the device, nmclican be used connect to APs

	nmcli dev wifi connect AP-SSID password APpassword


#### Wi-Fi recon with aircrack-ng
First, the wireless network card needs to be in **monitor mode**
To put your wireless network card in monitor mode, use the airmon-ng command from the aircrack-ng suite. The syntax for this command is simple: 

	airmon-ng start|stop|restart interface

Now we’ll use another tool from the aircrack-ng suite to find key data from the wireless traffic. The *airodump-ng* command captures and displays the key data from broadcasting APs and any clients connected to those APs or within the vicinity.

	airodump-ng interface_from_airmon-ng

#### Bluetooth
Linux has an implementation of the Bluetooth protocol stack called BlueZ that we’ll use to scan for Bluetooth signals.
BlueZ has a number of simple tools we can use to manage and scan Bluetooth devices, including the following: 
	
	hciconfig This tool operates very similarly to ifconfig in Linux, but for Bluetooth devices
	hcitool This inquiry tool can provide us with device name, device ID, device class, and device clock information, which enables the devices to work synchronously
	hcidump This tool enables us to sniff the Bluetooth communication, meaning we can capture data sent over the Bluetooth signal

First, use hciconfig to check if the bluetooth adapter is recognized and enabled to scan for other devices

	hciconfig

The next step is to check that the connection is enabled, which we can also do with hciconfig by providing the name and the upcommand:

	hciconfig hci0 up   (it can be blocked by rfkill, use rfkill unblock bluetooth)

Now that we know our adapter is up, we can use another tool in the BlueZ suite called hcitool, which is used to scan for other Bluetooth devices within range.

	hcitool scan

Now let’s gather more information about the detected devices with the inquiry function inq: 

	hcitool inq
	
#### Scanning for Services with sdptool 
Service Discovery Protocol (SDP) is a Bluetooth protocol for searching for Bluetooth services (Bluetooth is suite of services), and, helpfully, BlueZ provides the sdptooltool for browsing a device for the services it provides. It is also important to note that the device does not have to be in discovery mode to be scanned. The syntax is as follows:

	sdptool browse MACaddress

#### Seeing Whether the Devices Are Reachable with l2ping 
Once we’ve gathered the MAC addresses of all nearby devices, we can send out pings to these devices, whether they’re in discovery mode or not, to see whether they are in reach. This lets us know whether they are active and within range. To send out a ping, we use the l2ping command with the following syntax:

	l2ping MACaddres