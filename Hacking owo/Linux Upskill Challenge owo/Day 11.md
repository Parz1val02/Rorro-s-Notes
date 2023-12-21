#Linux 
### Finding things...
#### locate
By default, locate treats a search for `something` as `*something*`
`updatedb` creates an index that locate queries in order to find files. It is normally run by cron
To manually update the index: ` sudo updatedb`

#### find
The find command can narrow down the search by searching down a directoy structure and using certain criteria
It may take longer than lcoate because it searches the file system rather than an index. It also may get *"permission denied"* since it uses permissions of the logged in user.
[find command examples](https://www.linuxtechi.com/find-command-examples-in-linux/)

#### grep -R
Search recursively through a whole directory structure
(-R follow symbolic links, -r does not)
Use it along -i for non case sensitive searches
It is most useful for the /etc /var/log folders since it only works in files

>To view .gz files ou cans use zless or zgrep

#### which
Searches the location of a program's binary

#### whereis