#Linux 
#### tr - translate
`-c` -> complement
`-d` -> delete
`-s` -> squeezes 
`-t` -> truncate
Very useful for rot13 or any type of those cyphers

#### awk
- Print a file with awk -> `awk '{print}' file.txt`
- Search for a pattern -> `awk /pattern/ file.txt`
##### Built in variables
__Field variables__ -> $1,$2,$3,...$n specify a piece of data that is separated by a delimeter (the default delimiter is space)
`awk '{print $1,$3}' file.txt`
*$0 refers to the whole line* 
__NR__ -> Number record or number of rows
`awk '{print NR,$0}' file.txt`
**FS** -> Field separator or delimiter, the default is space. It is used in the input stream and used with the _BEGIN_ command. Likewise, _END_ also exits
`awk 'BEGIN{FS="o"} {print $1,$3} END{print "Total rows=" NR}' file.txt`
**RS** -> Record separator or row seaprator, the default is \\n
`awk 'BEGIN{RS="o"} {print $0}' file.txt`
**OFS** -> Output field separator, like _FS_ but for output stream
`awk 'BEGIN{OFS=":"} {print $0,$0}' file.txt`
**ORS** -> Output record separator
`awk 'BEGIN{ORS="\n\n"} {print $0}' file.txt`
**NF** -> number of files in a record or row. It can also be used to print the last field of a row
`awk '{print $NF}' file.txt`