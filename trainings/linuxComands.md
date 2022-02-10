# Linux commands
#### 20 Jan 2022
- Commands learned
```
cat
less
mkdir
Some Git commands[Includes clone]
history
```

#### 21 Jan 2022
- Commands learned
```
- Leared abot date and cal commands.
- Discussed about backups and rename[mv] commands
- To create a EMPTY file  # touch
- Create a file with CAT COMMAND # cat >> filename 
- To find hidden files # ls -la
- List the files with sorting manner # ls -lrt
- Create a directory # mkdir
- Create a file with data # vi filename
- Remove a file # rm filename
- Remove a director/folder # rm -rf directoryName
```

#### 24 Jan 2022
- Discussed topics
```
- Usage of ls, file permissions[chmod].
- r=4, w=2, x=1, user permissions[chown]
- Disk free[df -h] on a instance.
- Disk usage[du -sh *], it lists all file and directories usage.
- Verify app logs[/var/logs/]
- Usage of top command. 
```

#### 25 Jan 2022
- Discussed topics
---
- wc: word count[wc -l, wc <FILENAME>]
- grep: It is a search utility in Linux. Ex: grep WORD <FILENAME>/<DIRECTORY>
- vi editor:
```
Usage: vi <FILENAME>
Esc + i = Insert mode
Esc + u = Undo
Esc + o = New line[Include Insert]
Esc + i -> Esc + : -> %s/<WORD-WHICH-YOU-WANT-TO-REPLACE>/<RESULTANT-WORD>/g [Ex: %s/Linux/Ubuntu/g]
Esc + :<LINENumber> =  To go to specific line to Edit[Ex: Esc + :10 + Enter]
Esc + 0 = To come to the start of the line in a file
Esc + shift + A = To goto the END of the line
Esc + dd = Delete a line.
Esc + 2 + dd = Delete 2 lines in a row.
Esc + shift G = To go to end of the file.
Esc + gg = To go to start of the file.
Esc + shift V + d = To select and delete lines.
Esc + shift V -> Select lines -> Shift : -> s/<WORD YOU WANT TO REPLACE>/<RESULTANT-WORD>/g
```
- sed: Stream editor, 
```
Ex:
Dry run:
sed 's/Ganesh/Sudheer/g' FILENAME

Replace a word in a file:
sed -i 's/Ganesh/Sudheer/g' FILENAME
```

#### 26 Jan 2022
  
- find:
```
Usage: find WHERE-TO-SEARCH -name FILENAME/REGULAR-EXPRESSION

❯ find Desktop -name "*.png" # To find all .png files in Desktop

❯ find ~/Desktop -name test.sh -exec cat {} \; # To find and cat a file

❯ find ~/Desktop -name "*.sh" |xargs ls -lrt #To find and list the files using XARGS

❯ find . -type d # To fine directory

❯ find . -type f # To find files

❯ find . -mtime -1 # Find files/Directories with in a day

❯ find . -type f -mmin +10 # Find files with >10min aged old files

❯ find . -mmin +15 -type d -exec cp -a {} {}.back \;  # To take back up of a file or directory 
❯ find . -name s-1 -exec cp {} {}.$(date +%d%m%y%Hh%Mm) \;
❯ find . -type f -exec cp {} {}.$(date +%d%m%y%Hh%Mm) \;

DELETE A FILE OR DIRECTORY:
❯ find . -type f -name s-1.sudheer -delete
❯ find . -type f -mmin -5

```

Ex:

- FIND TYPE Example
```
❯ ls -lrt
total 0
-rw-r--r--  1 mouliveera  staff   0 Jan 26 09:58 s-1
-rw-r--r--  1 mouliveera  staff   0 Jan 26 09:58 s-2
-rw-r--r--  1 mouliveera  staff   0 Jan 26 09:58 s-3
-rw-r--r--  1 mouliveera  staff   0 Jan 26 09:58 s-4
-rw-r--r--  1 mouliveera  staff   0 Jan 26 09:58 s-5
-rw-r--r--  1 mouliveera  staff   0 Jan 26 09:58 g-1
-rw-r--r--  1 mouliveera  staff   0 Jan 26 09:58 g-2
-rw-r--r--  1 mouliveera  staff   0 Jan 26 09:58 g-3
-rw-r--r--  1 mouliveera  staff   0 Jan 26 09:58 g-4
-rw-r--r--  1 mouliveera  staff   0 Jan 26 09:58 g-5
drwxr-xr-x  2 mouliveera  staff  64 Jan 26 09:59 sudheer-1
drwxr-xr-x  2 mouliveera  staff  64 Jan 26 09:59 ganesh-1

~/Desktop/ganesh/sudheer
❯ find . -type f
./g-5
./g-2
./g-3
./g-4
./s-1
./g-1
./s-4
./s-3
./s-2
./s-5

~/Desktop/ganesh/sudheer
❯ find . -type d
.
./sudheer-1
./ganesh-1
```



- CD Usage
```
- cd : Takes you to HOME directory
- cd .. : Takes your to prevous directory
- cd . : You will be in the same directory
- cd - : To go back to previous directory

Ex:
---
❯ pwd
/Users/mouliveera/Desktop/ganesh

❯ cd ..

❯ pwd
/Users/mouliveera/Desktop

❯ cd -

❯ pwd
/Users/mouliveera/Desktop/ganesh

❯ cd

❯ pwd
/Users/mouliveera
---
```

- locate:
```
Locate: It will find th file/Directory data from system cache or local DB.

Ex: 
locate FILENAME/DIRECTORY
```

- Cut
```
cut: Linux utility tool to trim output

d: Delimeter
f: Field

Ex:
---
❯ cat image-tags-2.sh |grep TAG= |grep -v \# |cut -d'-' -f1
TAG=2021

~
❯ cat image-tags-2.sh |grep TAG= |grep -v \# |cut -d'-' -f2
07

~
❯ cat image-tags-2.sh |grep TAG= |grep -v \# |cut -d'-' -f3
29;

~
❯ cat image-tags-2.sh |grep TAG= |grep -v \# |cut -d'-' -f1,2,3
TAG=2021-07-29;
---

Work on:
❯ cat image-tags-2.sh |grep TAG= |grep -v \# |cut -d'-' -f1,2,3 |sed 's/TAG/DATE/g'
DATE=2021-07-29;

```

- awk
```
awk: Is a tool like "cut" in Linux.

Ex:
awk {print} FILENAME
awk '{print $1}' FILENAME
```

- Linking

- SoftLink
```
- Both source and copied file maintains different INODE Number
- Source file deletes, linked file is no more useful, it losts all the records.

Usage: ln -s <SOURCE> <DESTINATION>
```
Ex:
❯ ln -s Repository/learn/trainings/linuxComands.md.backup hardlink.md

- HardLink 
```
- If you remove a original file,  copied file stays.
- Source file and copied file both maintains the same INODE number.


Usage: ln <SOURCE> <DESTINATION>
```
Ex:
❯ ln Repository/learn/trainings/linuxComands.md.backup hardlink.md

## 9 Feb 2022
```
echo $@    -> To print all the arguments that you passed.

echo $#    -> To print number of arguments that you passed.

echo $?   -> Exit code of previously ran commands

> - Redirects the command results
>> - Appends the command results
1> - StandardOut
2> - StandardError
```

#### Exit CODES:
0 - Sucess
1-255 - Failure


- Exits with a zero (0) exit status has succeeded.
- A non-zero (1-255) exit status indicates failure.
- If a command is not found, the child process created to execute it returns a status of 127. If a command is found but is not executable, the return status is 126.

```
Ex:
❯ echo Trainings
Trainings

❯ echo $?
0
---
❯ mkojojo
zsh: command not found: mkojojo

❯ echo $?
127
```

####  IF CONDITION

SYNTAX: 
if [ CONDITION ]
	then
	STATEMENT
















