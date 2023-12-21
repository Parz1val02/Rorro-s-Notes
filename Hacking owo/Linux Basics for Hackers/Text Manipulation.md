#Linux
# Text Manipulation
head command:
	Displays first ten lines of a file. Use a flag (-number) to display the first number of lines

tail command:
	Displays last ten lines of a file. Use a flag (-number) to display the last number of lines

nl command (number lines):
	Useful with files that have lots of lines of text. This command displays a number in each line, making referencing much easier.

**A really popular and useful command for text manipulation is grep**

sed command:
	Searches for occurrences of a word or text and it allows you to replace it
	s - searches the word 
	g - makes global changes
	number - you can specify a number at the end to change and specific iteration of the word
	Nothing at the end means the first iteration is changed
	For example:
	- sed s/mysql/MySQL/g /etc/snort/snort.conf > snort2.conf
	- sed s/mysql/MySQL/   /etc/snort/ snort.conf > snort2.conf
	- sed s/mysql/MySQL/2 /etc/snort/snort.conf > snort2.conf

more command:
	This command allows you to see bigger files better by showing it in pages
	
less comannd:
It is similar to the more command, but it has added features. by typing / and the term you are searching for, it takes you to the first iteration of the word. By pressing n you move to the next one 