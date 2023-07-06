#Linux 
Environment variables are system-wide variables built into your system and interface that control the way your system looks, acts, and “feels” to the user. Always in UPPERCASE

Shell variables, on the other hand, are typically listed in lowercase and are only valid in the shell they are set in

Variables are simply strings in key-value pairs. Generally, each pair will look like KEY=value. In cases where there are multiple values, they will look like KEY=value1:value

### Viewing and modifying environment variables
To view all default environment variables for the user, use the *env* command

#### Viewing all environment variables
To view all environment variables, including shell variables, local variables, and shell functions such as any user-defined variables and command aliases, use the *set* command

#### Changing variable values for a session
Just type the variable and assign a value
	
	HISTSIZE=0 
This will only change the value of the variable for that particular session. If you close the terminal, the values resets to its default value

#### Making Variable Value Changes Permanent
If you want to make the changes permanent, you need to use the *export* command. This command will export the new value from your current environment (the bash shell) to the rest of the system, making it available in every environment until you change and export it again

	HISTSIZE=0 
	export HISTSIZE
	
	PS1 variable
	\u The name of the current user 
	\h The hostname 
	\w The base name of the current working directory
	
	PATH variable  --- echo $PATH ----> show the directories where PATH will look for commands
	To add a new directory where a tool or command is located:
	PATH=$PATH:/home/kali/.../... (for example)
$PATH is important because this way it appends the new directory and does not replace the old ones

### Creating a user defined variable
The syntax is straight forward: enter the name of your variable, followed by the assignment symbol (=), and then the value to put in the variable

	MYNEWVARIABLE="Hacking is the most valuable skill set in the 21st century"

This assigns a string to the variable MYNEWVARIABLE. To see the value in that variable, use the echocommand and the $content symbol with the variable name

	echo $MYNEWVARIABLE

It needs to be exported to exist in other sessions

To delete a variable use

	unset $MYNEWVARIABLE

