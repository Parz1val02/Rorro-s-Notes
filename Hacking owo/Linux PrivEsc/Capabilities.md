#WebExploitation 
Capabilities in Linux are a way to grant fine-grained permissions to processes without requiring them to run with full root privileges
Some common capabilities in Linux include `CAP_NET_RAW` for raw socket access, `CAP_SYS_ADMIN` for system administration tasks, and `CAP_SETUID` for changing the user ID of a process

The `CAP_SETUID` capability is a capability in Linux that allows a process to change its effective user ID (UID) to any UID, including that of another user.

*getcap* -> displays a list of enabled capabilities
`getcap -r / 2>/dev/null` -> recursively display all files under / with capabilities enabled