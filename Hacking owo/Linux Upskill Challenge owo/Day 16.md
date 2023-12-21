#Linux 
### Archiving and compressing
#### Creating archives
Create a "snapshot":
`tar -cvf archive.tar /path/to/file` -> [c]reate an archive and write it to a [f]ile, [v]erbosity
Compress the file:
`gzip archive.tar`
*Tarball* -> A compressed tar archive
>Always have the -f switch at the end

##### tar.gz
`tar -cvzf archive.tar.gz /path/to/file`
##### tar.bz2
`tar -cvjf archive.tar.bz2 /path/to/file`

>bz2 compresses and creates a smaller archive file than gzip, but it takes more time to compress and decompress

#### Extract a tar, tar.gz, tar.bz2
`tar -xvf archive.tar -C /specify/directory` -> the -C switch tells tar to extract in the specify directory

#### List content of a tar, tar.gz, tar.bz2
`tar -tvf archive.tar`

[Useful tar commands](https://www.tecmint.com/18-tar-command-examples-in-linux/)
>gzip and gunzip