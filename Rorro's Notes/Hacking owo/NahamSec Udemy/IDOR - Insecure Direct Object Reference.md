#WebExploitation 
IDOR occurs when an application provides direct access to objects based on user-supplied input. This allows attackers to retrieve, modify or even delete data that belongs to other users by manipulating the request
![[IDOR1.JPG]]
![[IDOR2.JPG]]
Discover the many ways an api sends requests and fetches data. Analyze allt eh traffic with burp or in the network tab

*USE TWO DIFFERENT ACCOUNTS TO TEST FOR IDOR*
url encode certain characters to bypass restrictions, like `&` while providing parameters in a post request 