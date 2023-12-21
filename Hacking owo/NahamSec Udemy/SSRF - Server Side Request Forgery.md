#WebExploitation 
In a SSRF attack, a malicious actor can abuse functionality on the server to read or update internal resources. It allows an attacker to to make requests originating from the server
- Blind -> Allows to scan for accesible hosts and ports
- Full Response -> Allows to see the entire response from the server
- Limited or No Response -> Shows a partial (or no) response, but access to the resources is still possible
![[SSRF.JPG]]
The requests could be made from a proxy, the server uses it to reach out to external resources
file:///etc/passwd -> reach out from the server to ther server's own resources
http://localhost -> access a machine's loopback
http://localhost:80 or any port number 
http://127.0.0.1
http://127.0.0.1:80
*Fetch metadata*
	http://169.254.269.254
	http://169.254.169.254/metadata/v1
> 169.254.169.254 is used in [AWS](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-instance-metadata.html), [Azure](https://docs.microsoft.com/en-us/azure/virtual-machines/windows/instance-metadata-service?tabs=windows) and other cloud computing platforms to host instance metadata service	