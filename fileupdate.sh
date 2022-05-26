
#CS 345 Operating Final Project:
#By Lauren, Christy, Courtney

#!/bin/bash

cd $HOME   #Takes user to HOME directory or desktop

cat /etc/passwd | cut -d: -f1 /etc/passwd | awk -F: '{ print $1, $7 }' /etc/passwd  | awk -F: '{ if($7 != "/usr/sbin/nologin") print NR, $1}' /etc/passwd | ls -aroot | ls -root | awk -v x=8 '{ print $x, $(x-1), $(x-2), $(x-3) }'
#Terminal shows what files are avialable for the user (mostly Desktop directories) and what time they were last accessed. The last accessed file appears at the bottom.

cat /etc/passwd | cut -d: -f1 /etc/passwd | awk -F: '{ print $1, $7 }' /etc/passwd  | awk -F: '{ if($7 != "/usr/sbin/nologin") print NR, $1}' /etc/passwd | ls -aroot | ls -root | awk -v x=8 '{ print $x, $(x-1), $(x-2), $(x-3) }'|ls Downloads
#Same output as above, but inculdes the list of files within the Downloads directory. This will help users know if the NEW_File has been created. 

cd ./Downloads    #Takes user to Downloads directory
cat >NEW_File.txt #Creates a text file called NEW_file.txt within the Downloads diretory. Users will also be prompt to put in words in fill for the file. Control+D to finish inputing words 

cd $HOME

cat /etc/passwd | cut -d: -f1 /etc/passwd | awk -F: '{ print $1, $7 }' /etc/passwd  | awk -F: '{ if($7 != "/usr/sbin/nologin") print NR, $1}' /etc/passwd | ls -aroot | ls -root | awk -v x=8 '{ print $x, $(x-1), $(x-2), $(x-3) }'
cat /etc/passwd | cut -d: -f1 /etc/passwd | awk -F: '{ print $1, $7 }' /etc/passwd  | awk -F: '{ if($7 != "/usr/sbin/nologin") print NR, $1}' /etc/passwd | ls -aroot | ls -root | awk -v x=8 '{ print $x, $(x-1), $(x-2), $(x-3) }'|ls Downloads
#These commands above, sow the new time the Downloads directory has been messed with or accessed. Users can now see on the terminal that the NEW_File.txt has been added to the Downloads directory. 

cd ./Downloads
cat NEW_File.txt  #Checks to see if user's input has been put into file


cd $HOME