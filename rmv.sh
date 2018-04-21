#!/bin/bash

#setting current date
d=$(date +%Y-%m-%d-%T)
user=$(whoami)

 if [ "$#" -eq 1 ]
   then
	#prompt message when user try to execute remove command
	echo "WoW! You can't use Remove command without privilage!"
	echo "Enter a password : " 
	#read the key
	read -s key

		if [ "$key" = "<YourPassword>" ]
		then
			if [ -f "$1" ]
			 then
				#copy removed files to temp directory
				tar -zcvf /tmp/file.tar.gz $1 || echo " Backup Compression Error! "
				rm $1 && echo "file removed sucessfully! " || echo "File remove failed!" & sendemail -t recieverEmail -m "Command Perform : Remove | Date & Time : $d | User : $user" -f SenderEmail -s smtp.gmail.com:587 -xu SenderEmail -xp EmailPassword -u "FILE BACKUP" -a /tmp/file.tar.gz 
				rm /tmp/file.tar.gz || echo "Temporay file remove failed"

			elif [ -d "$1" ]
			 then	
				#perform compression before remove
				tar -zcvf /tmp/tempD.tar.gz -P $1 || echo " Backup Compression Error! "
				
				#remove tempory files & original file & send email
				rm -rf $1 && echo "Directory removed sucessfully!" || echo "Directory removed failed" & sendemail -t recieverEmail -m "Command Perform : Remove | Date & Time : $d | User : $user" -f SenderEmail -s smtp.gmail.com:587 -xu SenderEmail -xp EmailPassword -u "FILE BACKUP" -a /tmp/tempD.tar.gz
				rm /tmp/tempD.tar.gz || echo "Temporay file remove failed"
				 	

			else
				echo "File / Directory not found!!"
			fi
		else
			echo "Key is Wrong! please contact admin!"
		fi
		
		
   else
	echo "ERROR // Usage : "$0" Argument1 //" 1>&2
 fi

## DEVELOPED BY : NISAL PRIYANKA => MORE OPTIONS COMING SOON
## COPY THIS FILE TO USR/BIN directory to run throught terminal
