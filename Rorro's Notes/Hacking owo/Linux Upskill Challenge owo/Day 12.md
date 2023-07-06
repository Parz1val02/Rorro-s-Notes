#Linux 
### Transfering files
#### SFTP
Connect to a server:
`sftp username@serverIP`
`-i`: specify an identity file, the authentication key
`put`: uploads file to the remote server
`get`: downloads file from ther server
`mput, mget`: allows for multiple files
#### SCP
Secure copy is another alternative that allows to transfer files from and to a remote machine
`scp file.txt username@serverIP:/path/to/directory`
`scp username@serverIP:/path/to/directory/file.txt /local/path/to/directory`
`-r`: copy an entire directory
`-C`: compresses the file for the transfer

>rsync can also be an option