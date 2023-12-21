#Linux 
WHAT IS A KERNEL MODULE? 
The kernel is the central nervous system of your operating system, controlling everything it does, including managing interactions between hardware components and starting the necessary services. The kernel operates between the user applications you see and the hardware that runs everything, like the CPU, memory, and hard drive.

	LKMs: loadable kernel modules

	uname -a  -> kernel version
	/proc/version -> this file stores the kernel information

#### Kernel Tuning
Modern Linux kernels use the sysctl command to tune kernel options. All changes you make with sysctl remain in effect only until you reboot the system. To make any changes permanent, you have to edit the configuration file for sysctl directly at /etc/sysctl.conf

	sysctl -a -> lists sysctl options
	sysctl -w net.ipv4.ip_forward=1 -> enables ip fordwarding temporarily
	uncomment net.ipv4.ip_forward=1 in /etc/sysctl.conf for permanent changes
	disable ICMP echo requests by adding the line net.ipv4.icmp_echo_ignore_all=1 to /etc/sysctl.conf
	After adding the line, you will need to run the command sysctl -p

	lsmod -> lists kernel modules
	modinfo module_name -> more info on an specific module

	Add module:
	modprobe -a module_name
	Remove module:
	modprobe -r module_name
	dmesg -> prints out message buffer from the kernel