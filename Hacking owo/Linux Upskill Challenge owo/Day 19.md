#Linux 
### Inodes, symlinks and other shortcuts
#### Linux virtual filesystem
*inode*: layer between the filename and the file's actual data on the disk
`ls -li` or `stat` to see the inode
*filename* -> *inode* -> *data on disk*
>Hard link: 
>`ln file link_name`
>Symbolic link:
>`ln -s file link_name`

[Hardlink and softlink](https://linuxgazette.net/105/pitcher.html)