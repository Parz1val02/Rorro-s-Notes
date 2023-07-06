#Linux 
### locate command:
This command will go through your entire filesystem and locate every occurrence of
that word. 

	locate (word)

### whereis command:
This command returns  the location of the binary plus its source and man page if they are available

	whereis (binary)

### which command:
The which command is even more specific: it only returns the location of the binaries in the PATH variable in Linux. The PATH variable holds the directories in which the operating system looks for the commands you execute at the command line

	which (binary)

### find command:
The find command is the most powerful and flexible of the searching utilities. It is capable of beginning your search in any designated directory and looking for a number of different parameters, including, of course, the filename but also the date of creation or modification, the owner, the group, permissions, and the size. 

	find directory options expression

First, the directory in which to start the search is stated. 
-type: this flag specifies the type of file to search for
-type f  *means ordinary file*
-name: this flag gives the name of the file
Use wildcards like file.* to look for all tipes of files that begin with *file* 
The find command shows only exact searches


A QUICK LOOK AT WILDCARDS 
Let’s say we’re doing a search on a directory that has the files cat, hat, what, and bat. The ? wildcard is used to represent a single character, so a search for ?at would find hat, cat, and bat but not what, because at in this filename is preceded by two letters. The [] wildcard is used to match the characters that appear inside the square brackets. For example, a search for [c,b]at would match cat and bat but not hat or what. Among the most widely used wildcards is the asterisk (*), which matches any character(s) of any length, from none to an unlimited number of characters. A search for *at, for example, would find cat, hat, what, and bat.