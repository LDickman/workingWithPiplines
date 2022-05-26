UNIX Pipelines README
Publishers: Lauren Dickman, Christy Keinsley, & Courtney Arrowood
Overview:
	In this final project we were asked to create a pipeline that does something interesting and useful for someone who is in charge of managing the lab machines as a system administrator. Students using the lab computer in Lynn Hall do not have access to all the files on the commuter, or have access to other users' files. Thus, it would be useful to know what exactly students are able to access on these lab computers. These are the commands to run the shell script, that indulde all the pipelines and commands that we will dicuss later on in detail:
								     chmod +x fileupdate.sh
                                                                   ./fileupdate.sh
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _ _ _ _ _ _ 		
	The first command in the pipeline uses the cat, which is short for “concatenate“; command. The cat command allows users to create single or multiple files, view content of a file, concatenate files, and redirect output in terminal or files. In this command:                    

                                                            	      cat /etc/passwd
	
This shows all the content of the etc/passwd for that particular user. All the files within the etc/passwd are files that exist for that user, however, it does not generate that the user has access to these files.  Another issue with using this particular command is that it overwhelms the terminal with information from the name of the file and the path to that file.
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ _ _ _ _ _ _ _ _ 
        
	The second command uses the cut which is a command-line utility that allows users to cut parts of lines from specified files or piped data and print the result to standard output. It can be used to cut parts of a line by delimiter, byte position, and character. 
Flags for the cut command that we used are:
                          -f (--fields=LIST) - Select by specifying a field, a set of fields, or a range of fields. This is the most commonly used option.
                          -d (--delimiter) - Specify a delimiter that will be used instead of the default “TAB” delimiter.
                                                      
                                                      		| cut -d: -f1 /etc/passwd

In the command above, we are cutting the unnecessary information produced from the first command into one list of the names of the files within the etc/passwd file. 
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 
        The third command uses the awk command which is a scripting language used for manipulating data and generating reports. The awk command programming language requires no compiling and allows the user to use variables, numeric functions, string functions, and logical operators. In this command:         
                                               
                                               			| awk -F: '{ print NR, $1, $7 }' /etc/passwd
	
We divided the data of the etc/passwd into records and fields. The fields in each record are referenced by the dollar sign ($) followed by field number. The first field ($1) shows data of the name of the files that exist. While the seventh field ($7) shows data of the path to the file. The NR flag, numbers the files within the etc/passwd file in order. The fourth command:                        
                               
                               					| awk -F: '{ if($7 != "/usr/sbin/nologin") print NR, $1}' /etc/passwd

This command still uses the awk command, however it narrows down what files do not require a login, or in the case do not have the path that includes “nologin.”  As it mentioned before the NR number the files, however, for this command above the files are not in order. The files , instead, are numbers with the same values from the previous command ordered, except the values that included the “nologin” path are not shown in the order.  
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _  _ _ _ _ _ 
	Now that we have narrowed down the files that we the users can access on these lab computers. In the seventh field, which are the file paths, we noticed that the paths are connected back to the root, or the username. Thus, we need to know what files exist within the root.  The fifth command:
                                                                          
                                                                       | ls -aroot
	
This Linux command allows you to view a list of the files and folders in a given directory. In this case, we are using the flag -a which shows all files, even the hidden ones, of the root directory on the terminal. The hidden files do not interest us since the hidden files users are not given access to look or mess with these hidden files. Thus we use this common command next to narrow down what files we can mess with:        
                                                                       | ls -root
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ 
	We are now given the files that we are able to access, create new files, or delete said files. There is always the possibility that someone will mess with another user’s computer when they leave their computer unintended for a while. This seventh command:                                
                                                                       | awk -v x=8 '{ print $x, $(x-1), $(x-2), $(x-3) }'
	
Allows to see all the files we have access to and what time they have been accessed.  
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ 
	Now that we discussed what our pipeline is doing, which is checking what is accessible to users and displaying what time the files have been accessed. Let’s take a step further to see how adding a file to a directory changes the output of the pipeline. 

To begin, in the orignal pipeline we are adding ls to a directory to see what file cruelty exists. 
For example in the shell program we are going into the Downloads directory.                         
                                                                      
                                                                      | ls Downloads
	
In this command above,  we can see the list of files that currently exist within the Downloads directory. 
Then we are going to get into that directory using the cd ./ command and create a new file called NEW_File using the cat command in that directory. 
By using these commands:                        
                                                                     cd ./Downloads
                                                                     cat >NEW_File.txt
	
The cat command above allows users to also write into that file. After users have imputed the text, the shell program will go back to the home directory using the command:
                                                                      
                                                                    cd $HOME
	
Finally the shell program will use the two original pipelines from before one with the ls Download and another without:

								      cat /etc/passwd | cut -d: -f1 /etc/passwd | awk -F: '{ print $1, $7 }' /etc/passwd  | awk -F: '{ if($7 != "/usr/sbin/nologin") 
								      print NR, $1}' /etc/passwd | ls -aroot | ls -root | awk -v x=8 '{ print $x, $(x-1), $(x-2), $(x-3) }' 

								      cat /etc/passwd | cut -d: -f1 /etc/passwd | awk -F: '{ print $1, $7 }' /etc/passwd  | awk -F: '{ if($7 != "/usr/sbin/nologin") 
								      print NR, $1}' /etc/passwd | ls -aroot | ls -root | awk -v x=8 '{ print $x, $(x-1), $(x-2), $(x-3) }'|ls Downloads
	
These two commands will  show the changed times of when the Downloads directory was accessed. Then we will ls into the Download directory and see that the file NEW_File has been added to the directory. To further check if NEW_File.txt has been correctly created we use the following command:
                                       
                                      			     cd ./Downloads
                                      			     cat NEW_File.txt
	
This allows us to go into our Downloads directory and use the cat command to read what was put into the New_File.txt. To finish putting in text within the NEW_File.txt users have to use control+D. Finally we go back to our Home directory, or our desktop, to finish. 

                                                           	    cd $HOME
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ __ _ _ _ _ 
	After looking through each command in the pipeline, we begin to realize that this pipeline is very one and it would be time consuming and a hassle to write this whole pipeline. Thus, our group has a solution by creating a shell script that instantly runs all the commands in the pipeline and the extra that we mentioned above. These commands are the ones that will run the shell script:
                                                                
                                                                 chmod +x fileupdate.sh
                                                                 ./fileupdate.sh
                                                                
