# UNIX_FILE_BACKUP_V1
This is a Bash shell script to automatically backup files when performing a remove command!
Features
  *Password Protection (Ask to enter password wehen performing remove command)
  *Automatically compress and store the file that we are going to remove. (Inside tmp folder)
  *Send Backup email to Admin (root) whith relevant details.
      Email contains => Perform Command , Date & Time , User who execute the command, Removed file
  *Remove file in tmp after sucessfully send it to the email
