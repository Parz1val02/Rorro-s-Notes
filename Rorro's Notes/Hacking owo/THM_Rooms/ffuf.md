#Tools 
At a minimum we're required to supply two options: `-u` to specify an URL and `-w` to specify a wordlist. The default keyword `FUZZ` is used to tell ffuf where the wordlist entries will be injected

>/usr/share/seclists/Discovery/Web-Content has the raft wordlists for directories, extensions, files and words

>`-ic` allows you to ignore comments in wordlists that such as headers, copyright notes, comments, etc
>`-c` for colorized output
> `-r` to follow redirects
> `-w -` read a wordlist from stdin
> `-v` for verbose
### Pages and directories
We can usually assume index.\<extension\> is the default page on many websites, so we can try for common extensions

`ffuf -u http://machine_ip/indexFUZZ -w /usr/share/seclists/Discovery/Web-Content/web-extensions.txt`

`.php` is the valid extension
Now that we know the extensions supported we can try a list of generic words (without of extension) and apply the extensions we know works + some common ones like `.txt`

`ffuf -u http://machine_ip/FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-words-lowercase.txt -e .php,.txt`

To fuzz for directories only provide a wordlist
`ffuf -u http://machine_ip/FUZZ -w /usr/share/seclists/Discovery/Web-Content/raft-medium-directories-lowercase.txt`

### Filters
Hide 404 responses with the -fc flag (filter code) `-fc 404`
To only see 200 responses use -mc flag (match code)
`-mc 200`
It coul also be useful to match 500 codes (internal server errors) to understand how the website works
`-fs 0` to filter a HTTP response size of 0 (`-ms` to match it)

We often see there are false positives with files beginning with a dot (eg. `.htgroups`, `.php`, etc.). They throw a 403 Forbidden error, however those files don't actually exist. It's tempting to use `-fc 403` but this could hide valuable files we don't have access to yet. So instead we can use a regexp to match all files beginning with a dot.
`-fr '/\..*'`

### Parameters
What would you do when you find a page or API endpoint but don't know which parameters are accepted? You fuzz!
Discovering a vulnerable parameter could lead to file inclusion, path disclosure, XSS, SQL injection, or even command injection. Since ffuf allows you to put the keyword anywhere we can use it to fuzz for parameters

`ffuf -u 'http://MACHINE_IP/sqli-labs/Less-1/?FUZZ=1' -c -w /usr/share/seclists/Discovery/Web-Content/burp-parameter-names.txt -fw 39`
`ffuf -u 'http://MACHINE_IP/sqli-labs/Less-1/?FUZZ=1' -c -w /usr/share/seclists/Discovery/Web-Content/raft-medium-words-lowercase.txt -fw 39`

`id` is the valid parameter
At this point, we could generate a wordlist and save a file containing integers. To cut out a step we can use `-w -` which tells ffuf to read a wordlist from pipe redirection
`for i in {0..255}; do echo $i; done | ffuf -u 'http://MACHINE_IP/sqli-labs/Less-1/?id=FUZZ' -c -w - -fw 33` 
`seq 0 255 | ffuf -u 'http://MACHINE_IP/sqli-labs/Less-1/?id=FUZZ' -c -w - -fw 33`

### Post requests and authentication brute force
We can also use ffuf for wordlist-based brute-force attacks, for example, trying passwords on an authentication page.

Here we have to use the POST method (specified with `-X`) and to give the POST data (with `-d`) where we include the `FUZZ` keyword in place of the password.
We also have to specify a custom header `-H 'Content-Type: application/x-www-form-urlencoded'` because ffuf doesn't set this content-type header automatically as curl does.

The post data will depend on how the application accepts the parameters. It always good to check this with burpsuite or in the network tab of the developer tools

`ffuf -u http://MACHINE_IP/sqli-labs/Less-11/ -c -w /usr/share/seclists/Passwords/Leaked-Databases/hak5.txt -X POST -d 'uname=Dummy&passwd=FUZZ&submit=Submit' -fs 1435 -H 'Content-Type: application/x-www-form-urlencoded'`

### Finding vhosts and subdomains
ffuf may not be as efficient as specialized tools when it comes to subdomain enumeration but it's possible to do.

`$ ffuf -u http://FUZZ.mydomain.com -c -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt`

Some subdomains might not be resolvable by the DNS server you're using and are only resolvable from within the target's local network by their private DNS servers. So some virtual hosts (vhosts) may exist with private subdomains so the previous command doesn't find them. To try finding private subdomains we'll have to use the Host HTTP header as these requests might be accepted by the web server.  
**Note**: [virtual hosts](https://httpd.apache.org/docs/2.4/en/vhosts/examples.html) (vhosts) is the name used by Apache httpd but for Nginx the right term is [Server Blocks](https://www.nginx.com/resources/wiki/start/topics/examples/server_blocks/).  

You could compare the results obtained with direct subdomain enumeration and with vhost enumeration:

`ffuf -u http://FUZZ.mydomain.com -c -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -fs 0`
`ffuf -u http://mydomain.com -c -w /usr/share/seclists/Discovery/DNS/subdomains-top1million-5000.txt -H 'Host: FUZZ.mydomain.com' -fs 0`

### Proxifying ffuf traffic
Whether it' for [network pivoting](https://blog.raw.pm/en/state-of-the-art-of-network-pivoting-in-2019/) or for using BurpSuite plugins you can send all the ffuf traffic through a web proxy (HTTP or SOCKS5).
`ffuf -u http://MACHINE_IP/FUZZ -c -w /usr/share/seclists/Discovery/Web-Content/common.txt -x http://127.0.0.1:8080`
It's also possible to send only matches to your proxy for replaying: 
`ffuf -u http://MACHINE_IP/ -c -w /usr/share/seclists/Discovery/Web-Content/common.txt -replay-proxy http://127.0.0.1:8080`
This may be useful if you don't need all the traffic to traverse an upstream proxy and want to minimize resource usage or to avoid polluting your proxy history.