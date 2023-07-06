#Linux 
A process is simply a program that’s running and using resources
### Viewing processes
*ps command*
Each process is displayed in the order they were started and assigned an ID (PID)

	px aux : this command lists all processes running on the system for all users

*top command*
Displays the processes ordered by resources used, starting with the largest

### Managing processes
**Changing process pirority with nice**: the nice command is used to influence the priority of a process to the kernel. The kernel will have final say over the priority of a process, but you can use nice to suggest that a process should be elevated in priority.

- The values for nice range from –20 to +19, with zero being the default value
- A high nice value translates to a low priority, and a low nice value translates to a high priority
- When a process is started, it inherits the nice value of its parent process
- The owner of the process can lower the priority of the process but cannot increase its priority
- superuser or root user can arbitrarily set the nice value of a process

*nice command*: set the priority of a process when you start it

	nice -n (+ or - number) process
	
*renice command*: alter the priority of a process after it has started running (values from-20 to 19)

	renice (+ or - number) PID

With the top utility running, pressing the R key allows to renice a process 

### Killing processes
At times, a process will consume way too many system resources, exhibit unusual behavior, or—at worst—freeze (zombie process), kill that wea
*kill command*

	kill -signal_number PID

| Signal name | Signal number | Description |
|-------------|---------------|-------------|
|SIGHUP       |   1    | Hangup (HUP) signal. It stops the designated process and restarts it with the same PID.
|SIGINT       |   2    | Interrupt (INT) signal. It is a weak kill signal that isn’t guaranteed to work, but it works in most cases.
|SIGQUIT      |   3    | Core dump. It terminates the process and saves the process information in memory, and then it saves this information in the current working directory to a file named core
|SIGTERM      |   15   | Termination (TERM) signal. It is the killcommand’s default kill signal.
|SIGKILL      |   9    | This is the absolute kill signal. It forces the process to stop by sending the process’s resources to a special device, /dev/null

*killall command*: Kills a process by taking its name as argument and not PID

	killall -signal_number process_name

With the top utility running, pressing the K key allows to kill a process 

### Running processes in the background
Running a process in the background simply means that it will continue to run without needing the terminal
*To do this, append an ampersand (&) at the end of the command*

fg command: moves a process to the foregrond, uses the PID

	fg PID

### Scheduling  processes
The atcommand is a daemon—a background process—useful for scheduling a job to run once at some point in the future
The syntax is simply the at command followed by the time to execute the process. The time argument can be provided in various formats.

