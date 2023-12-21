#Linux 
### The infamous "grep" and other text processors
>Apache access log: /var/log/apache2/access.log
>Recent logins and sudo usage: /var/log/auth.log

*While viewing a file in less:*
`F`: allows to follow the file in real time as new text is appended to it
*The same effect can be applied with tail:*
`tail -f file`
With both tail and head, the -n switch determines the number of lines to bre printed and -c flag determines the number of bytes

#### Useful Commands to learn more about
1. **grep**
	-n: display line number
	-i: not case sensitive
	-v: display lines that do not contain the pattern you're looking for
	-o: display only the pattern you are lookin for
	>Special characters:
		^ -> search at the beginning of the line
		$ -> search at the end of the line
		. -> search any character
	*egrep uses advanced regular expressions*
	*fgrep ommits regular expressions* 	

2. **cut**
3. **sort**
4. **uniq**
5. **awk** (awk one liners)
6. **sed** (linux sed tricks)
7. **wc**

### Regex to match an ip address
grep "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"

cat /var/log/apache2/access.log | grep -o "[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}" | sort | uniq
cat /var/log/auth.log | grep -o "[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}\\.[0-9]\\{1,3\\}" | sort | uniq