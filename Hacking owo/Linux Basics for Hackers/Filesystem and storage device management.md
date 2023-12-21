#Linux 

Mounting in this context simply means attaching drives or disks to the filesystem to make them accessible to the operating system (OS).

#### THE DEVICE DIRECTORY /DEV
Linux has a special directory that contains files representing each attached device: the appropriately named /dev directory

#### How Linux represents storage devices
Linux uses logical labels for drives that are then mounted on the filesystem. 
 floppy drives xd-> fdo
 hard drives -> hda
 Newer Serial ATA (SATA) interface drives and Small Computer System Interface (SCSI) hard drives -> sda
 When systems have more than one hard drive, Linux simply names them serially by incrementing the last letter in alphabetical order, so the first drive is sda, and the second drive is sdb, the third drive is sdc, and so on

 #### Drive partitions
 Some drives can be split into partitions in order to manage and separate information.
 Linux labels each partition with a minor number that comes after the drive designation. This way, the first partition on the first SATA drive would be sda1. The second partition would then be sda2, the third sda3, and so on

 At times, you may want to view the partitions on your Linux system to see which ones you have and how much capacity is available in each
 Do this with 

	 fdisk -l 
	 lists all partitions of all drives

#### Character and Block devices
With ls -l in /dev directory, you get that most of the entries start with either c or b

	c stands for character devices.External devices that interact with the system by sending and receiving data character by character, such as mice or keyboards, are character devices.

	b stands for bock devices. They communicate in blocks of data (multiple bytes at a time) and include devices like hard drives and DVD drives. These devices require higher­speed data throughput and therefore send and receive data in blocks (many characters or bytes at a time)

	***** lsblk: You can list basic information about each block device with the lsblk command. Does not require root privileges

#### Mounting and unmounting 
The point in the directory tree where devices are attached is known as the mount point. The two main mount points in Linux are /mnt and /media. As a general rule, internal hard drives are mounted at /mnt, and external USB devices such as flash drives and external USB hard drives are mounted at /media, though technically any directory can be used.

#### Mounting devices
To mount a device manually, use the mount command. You **need** an empty directory to do this. If you mount a device on a directory that has subdirectories and files, the mounted device will cover the contents of the directory, making them invisible and unavailable.

	mount /dev/... /empty_directory

	The filesystems that are mounted on a system are kept in a file at /etc/fstab (short for filesystem table)

#### Unmounting with umount
Similar to the mount command, you can unmount a second hard drive by entering the umount command followed by the file entry of the device in the /dev directory

	umount /dev/...
	
	You cannot unmount a device that is busy, so if the system is reading or writing to the device, you will just receive an error.

#### Monitoring filesystems

- Mounted disks: use the df (disk free) command to get info on any mounted disk
							  without options, df defaults to the the first drive

- Errors: use the fsck (filesstem check) command to look for errors and repair damage
			   To run the fsckcommand, you need to specify the filesystem type (the default is ext2)
			   **It’s important to note that you must unmount the drive before running a filesystem check**
				1. First unmount with umount
				2. Add the -p option to fsck to automatically repair any problems with the device