
| concept | help tags | notes |
|---------|-----------|-------|
| * | * | search for the word under the cursor |
| c | | change motion |
| ciw | | change inner word |
| cgn | :c :gn | c in the change operator and gn is a motion that selects the next search together it makes the c operator act on the next search hit. The neat thing is that the whole command can be repeated with the . operator and that way this works like a search and replace. |
| . | | Replay the last command |
| :%s/X/Y/g | :% :s cmdline-ranges  | replaces all occurences of X with Y in the current file. :% selects the entire buffer and s is the substitute command |
| :%s/X/Y/gc | :% :s  | same as above but ask for confirmation for each hit |
| :'<,'>s/X/Y/gc | :% :s  | same as above but for visual selection only. :'<,'> appears automatically if typing : while in visual mode |
| :reg |  | show registers. text is placed in a register when deleting or yanking text |
| "3p |  | paste the contents of the third register |
| "3y |  | yank to the third register |
| "+y |  | yant to the system clipboard |
| "%p |  | paste the name of the file that is open in the current buffer. "% is a special register that always holds the current files name. This seems to be related to the way % is used in the substitute command above maybe it's evaluated as the file name so one can just write the name explicitly instead? hmmm doesn't seem like it works |
| :let @+=@% |  | copy the current filename to the system clipboard. with let you can assign values to internal variables |
| qa | q | start recording macro 'a'. What it actually does is it records every keystroke into register a |
| q |  | stop recording a macro (must be in normal mode) |
| @a | @ | run macro 'a'. Actually it just executes the contents of register a as keystrokes. This means one can also execute something one has yanked |



