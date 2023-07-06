#Tools 
Use foxy proxy with FIrefox (127.0.0.1:8080)

To proxy https, download the burpsuite certificate
`http://burp/cert`
Download *cacert.der*
Import and trust this certificate in firefox settings

Scope certain domains/ips by adding them to the scope and stop logging the history of other web pages. Also, in client requests of the proxy, enable the feature `AND URL is in target scope` to only intercept this traffic

The site map in target is very useful to obtain a tree structure of the target

Burp Suite Repeater allows us to craft and/or relay intercepted requests to a target at will. In layman's terms, it means we can take a request captured in the Proxy, edit it, and send the same request repeatedly as many times as we wish.