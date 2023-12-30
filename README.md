# Tip of the Day 1.0 - Bash Script

## Description
This bash script displays a different "Tip of the day" each time it is run.
- Shows a new tip with every new terminal session
- Round robin for the tips: 1st, 2nd … last, 1st …
- Prompts for showing more tips
- Ability to deactivate the totd functionality for single user - useful if activated globally to all the users in a host.

## Optional requirements (under working...)
- Does not print out anything unless having the terminal available (does not break scp command)
- Ability to permanently skip a tip - won’t be displayed any more
- Admin page for configuring sources of tips. Open admin interface with some key like A. In the admin page implement configuration functionality like showing current configuration and changing it.

## To deactivate the totd functionality
Create a file `.notips` in the home directory of single user.
`touch ~/.notips`

## Instructions for setting up the system
Configure your personal linux environment to run the script every time when entering the terminal of your own Linux host or taking a SSH connection to your personal Linux host. 

Add command `sh` plus `the full path to this script` at the end of the ~/.bashrc file:
1. Open .bashrc file in your text editor
2. Add "sh /full/path/to/linuxtip.sh" to the end of this file
3. Save and exit

## Make sure path correct
In **linuxtips.sh**, there is code specifying the path or script and tips, modify it if you have different ones!

`scriptDir=~/tipScript`

`tipsDir=~/tipScript/tips`

## Example of how the script works
![alt text](https://raw.githubusercontent.com/jingjingyang0803/Shell-script/main/tip_example.png "Logo Title Text 1")