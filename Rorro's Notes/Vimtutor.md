>*To get stout into vim (usually through pipes) use a hyphen*
>`command | vim -`
 Write a file as root but don't exit
 `:w !sudo tee %`
#### Basic commands
`H, M, L` -> move cursor to the top, middle and bottom of the screen, respectively
`v` -> enter visual mode
`V` -> enter visual mode and highlight the whole current line
`Ctrl + v` -> visual block
`Ctrl + o`
`Ctrl + i`
`i` -> insert mode, insert text before the current cursor position
`I` -> enter insert mode at the beginning of the line
`a` -> insert text after the current cursor position 
`A` -> append text at the end of the line
`o` -> open insert mode in a line below the cursor
`O` -> open insert mode in a line above the cursor
`x` -> delete a character
`X` -> delete the character that is before the current cursor position
`u` -> undo previous action
`U` -> undo all the changes on a line
`r` -> replace the character under the cursor with another one you type
`R` -> enter replace mode and replace xd more than one character
`Ctrl+R` -> undo the undo's
`y` -> copy selected text
`yy` -> copy a whole line
`dd` -> delete a whole line
`cc` -> delete a whole line and puts you in insert mode
`cl` -> delete a letter and puts you in insert mode
`dl` -> delete a letter
`C` -> changes the rest of the line, enters insert mode
`D` -> deletes the rest of the line
`diw` -> delete all the word, even if the cursor position is not at the start
`ciw` -> change all the word, even if the cursor position is not at the start
`yiw` -> copy all the word, even if the cursor position is not at the start
Change in, delete in and yank in also works with `{} [] ()` and many other punctuation signs
	`ci"`
	`di"`
	`yi"`
`t(special character)` -> jumps one cursor position before that character, has to be on the same line
`T` -> something backwards
`f(special character)` -> jumps to the cursor position of that character, has to be on the same line
`F` -> something backwards
`;` -> repeats the motions forward from `t` or `f`
`,` -> repeats the motion backward from `t` of `f`
`m(letter)` -> mark that cursor position
`'(letter)` -> return to that cursor position 
`zz` -> center the screen
`{` -> up by paragraph
`}` -> down by paragraph
`*` -> search for that word
`#` -> reverse search for that word
`vi(special character)` 
`va(special character)`
`J` -> move line below to the end of the current line
#### Operators and motions
`operator count motion`
*operator: what to do, such as the delete operator `d`*
*motion: what the operator will operate on*
A short list of motions:
	w - until the start of the next word, EXCLUDING its first character
	W - until the start of the next WORD
    e - to the end of the current word, INCLUDING the last character
    E - to the end of the current WORD
    b - backward to the beginning of the word
    B - backward to the beginning of the WORD
    $ - to the end of the line, INCLUDING the last character
	_ - to the start of the line, INCLUDING the first character
	0 - to the beginning of the line
*Typing a number before a motion repeats it that many times*
`operator [number} motion`
`*`
`#`
#### More commands and operators
##### Put command
  1. To put back text that has just been deleted, type   p .  This puts the deleted text AFTER the cursor (if a line was deleted it will go on the line below the cursor).
##### Replace command
  2. To replace the character under the cursor, type   r   and then the character you want to have there.
##### Change operator
  3. The change operator allows you to change from the cursor to where the motion takes you.  eg. Type  ce  to change from the cursor to the end of the word,  c$  to change to the end of a line.
  4. The format for change is:
         c   [number]   motion
##### Substitute command
To substitute new for the first old in a line type  :s/old/new
To substitute new for all 'old's on a line type     :s/old/new/g
To substitute phrases between two line #'s type     :#,#s/old/new/g
To substitute all occurrences in the file type      :%s/old/new/g
To substitute all occurrences case insensitive      :%s/old/new/gi
To ask for confirmation each time add 'c'           :%s/old/new/gc

#### File location
`gg` -> move to the top of the file
`G` -> move to the bottom of the file
`Ctrl+G` -> show your location on the file and file status
`line numbre + G` -> move to that line

>Typing  %  while the cursor is on a (,),[,],{, or } goes to its match.
>. repeats the last command	
#### Command related stuff
  1.  :!command  executes an external command.

      Some useful examples are:
         (Windows)        (Unix)
          :!dir            :!ls            -  shows a directory listing.
          :!del FILENAME   :!rm FILENAME   -  removes file FILENAME.

  2.  :w FILENAME  writes the current Vim file to disk with name FILENAME.
	  :e FILENAME opens the file to the current vim tab

  3.  v  motion  :w FILENAME  saves the Visually selected lines in file
      FILENAME.

  4.  :r FILENAME  retrieves disk file FILENAME and puts it below the
      cursor position.

  5.  :r !dir  reads the output of the dir command and puts it below the
      cursor position.
  

#### Set command
  6. Typing ":set xxx" sets the option "xxx".  Some options are:
        'ic' 'ignorecase'       ignore upper/lower case when searching
        'is' 'incsearch'        show partial matches for a search phrase
        'hls' 'hlsearch'        highlight all matching phrases
     You can either use the long or the short option name.

  7. Prepend "no" to switch an option off:   :set noic

#### Tab navigation
Open a new tab (in command mode) -> `:tabnew`
Move between tabs:
`:tabprevious` (tabp is the abbreviated form)
`:tabnext` (tabn is the abbreviated form)
`:tabfirst`
`:tablast`
`:tabmove 0`

##### In command mode
:reg -> list of registers
:Ex
:.!date