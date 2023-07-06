#!/bin/bash
declare -r pwdfile=/etc/passwd #read only variable
echo $pwdfile
pwdfile=/etc/shadow
declare causa=kori #normal variable
echo $causa
causa=milo
echo $causa
