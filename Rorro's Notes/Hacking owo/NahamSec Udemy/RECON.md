Reconnaissance
- Asset discovery
	- Subdomain enumeration
	- Robots.txt
	- Sitemap.xml
	- Favicon
	- Framework stack
	- HTTP headers
	- Wayback machine
	- Wappalyzer
	- Google dorking
	- S3 buckets
	- Github 
 - Certificate transparency
	 - censys.io
	 - crt.sh
		  - `&ouput=json` -> use bash or python to pass json data and display it. *name_value* *common_name*
			```bash
curl -s https://crt.sh/\?q\=gm.com\&ouput\=json | jq -r '.[].name_value' | sed 's/\*\.//g' | sort -u | httprobe -c 50
			```
	 - Look into *aquatone*
	 - dnsgen
	 - shodan.io
	 - amass
	 - httprobe
- Crawling the site with burpsuite
- Nmap or masscan allow to scan for other open ports which may be running a web app
- Javascript files