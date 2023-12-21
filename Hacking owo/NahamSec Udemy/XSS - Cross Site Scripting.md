#WebExploitation 
XSS allows attackers to execute arbitrary client-side code on a victim's  browser.

#### Reflected XSS
- Payload is injected from the victim's request 
- Victim clicks on a malicious link or navigates to an attacker-controlled proprety
Both of these scenarios occur generally through parameters in the url via GET
![[ReflectedXSS.JPG]]

#### Stored XSS
- Payload is stored server-side and can be triggered by a victim with no interaction outside of the application
![[StoredXSS.JPG]]

#### DOM XSS
- The vulnerability is in the client-side code versus the server-side.  Injection is still typically from the vimctim's requeset

While testing for XSS, first try to search for html injection in inputs
- \<u>wenas\</u>
Then, scripts
- <script>alert(document.cookie)</script>
- <script>alert(document.location)</script>
- <script>alert(1)</script>
It's important to understand the context in which the payload will be run. 
*Example 1*
Inputs tags <input value=""> will not allow for the script tags to take effect
These input tags need to be escaped for the XSS to work, so `">` need to come before the payload to close the value parameter
*Example 2*
Title tags (<title> </title>) also won't allow for our html injection o XSS to render properly. 
To escape them, `</title>`, a closing title tag needs to precede the code for the html injection or XSS to work
*Example 3*
Javascript may be used to sanitize and encode characters that are sent through GET, such as <>
http://xss4.nahamsec.thm/?name=rod';+alert(1);//
In the parameter, the variable name contains `'` to close the string in the javascript code. Then, `;` ends the current line of code. alert(1) is interpreted now as a new command to execute. Finally, `;//` ends the next line of code and comments the rest of the script

>Another place for a potential XSS is the reflected text in a 404 page
>If this doesn't work, try adding a parameter
>http://nahamstore.thm/est?param=fdsa<image src=x onerror=alert() 
>onload=alert()
>onmouseover=alert()
>Use parameters passed with Post on requests that redirected with Get, start trying for XSS there