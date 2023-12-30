#!bin/bash

tty -s || exit # check if we have interactive shell


# Shows a new tip with every new terminal session
# Round robin for the tips: 1st, 2nd … last, 1st …
# Prompts for showing more tips



# Get the absolute path of the script in Bash
# scriptDir=$(dirname -- "$(readlink "$BASH_SOURCE")")
# SCRIPT_DIR=$( cd -P "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

# the path for script and tips, modify this if you have different ones!
scriptDir=/opt/totd

if [ ! "$TIPS_REPO" ]; then
	# Default value, access tips from local disk
	tipsDir=/opt/totd/tips
else
	# access from NFS server
	# TIPS_REPO=/nfs/tips   (AN ENV VAR)
	tipsDir=$TIPS_REPO
fi

# if the totd functionality is not deactivated (~/.notips does not exit)
if [ ! -f ~/.notips ]; then

          if test -f $scriptDir/.curtip; then
                    n=$(cat $scriptDir/.curtip)  # get the current tip id if .curtip exits
          else
                    echo 1 > $scriptDir/.curtip  # create file .curtip to store initial tip id
                    n=1
          fi

          # calculate total number of tips
          N=$(ls $tipsDir/*.txt | wc -l)

          date # display the current time
          # show that tip
          echo "           Tip of the Day!"

          next="y"

          # show more tips as user want
          while [ "$next" = "y" ]
          do
                    # show the tip
                    echo "-----------------Tip $n----------------------"
                    cat $tipsDir/$n.txt
                    echo "---------------------------------------------"

                    # Prompt for skip this tip
                    # read -p "Skip this tip permanently? (y/n) " skip

                    # Prompt for showing another tip
                    read -p "Show next tip? (y/n) " next

                    # update the id for next tip
	          n=$(($n%$N+1))
          done

          echo $n > $scriptDir/.curtip # store this tip id
fi
