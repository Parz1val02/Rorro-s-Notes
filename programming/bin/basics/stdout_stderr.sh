#!/bin/bash
ls -al 1>file1.txt # Stout will be asumed if no number is specified; >file1.txt
ls +al 2>file2.txt

#Send stderr into stdout
ls +al >file3.txt 2>&1
#Shortcut
ls +al >& file3.txt
