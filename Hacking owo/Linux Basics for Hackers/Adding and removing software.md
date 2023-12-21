#Linux 
### Using APT to handle software
Debian distributions: apt or Advanced Packaging Tool is the default software manager

#### Searching for a software package
	apt-cache search keyword
Searches in the repository whether the package needed is available

#### Adding software
	apt-get install packagename

#### Removing software
	apt-get remove packagename
The remove command doesn’t remove the configuration files, which means you can reinstall the same package in the future without reconfiguring

	apt-get purge packagename
Remove the configuration files at the same time as the package

#### Updating packages
	apt-get update
Updating simply updates the list of packages available for download from the repository

#### Upgrading packages
	apt-get upgrade
Upgrading will upgrade the package to the latest version in the repository

### Adding repositories
**Repositories: servers that hold the software for a particular distribution of Linux**
The repositories your system will search for software are stored in the sources.list file (/etc/apt/sources.list)

GUI-BASED installer: Synaptic (*apt-get install synaptic*)

### Installing software with git
command

	git clone (url)


