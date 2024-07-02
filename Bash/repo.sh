#!/bin/bash
# check for insufficient number of arguments

# take first parametr or ask for it if not specifyed
if [ $# -eq 0 ]
   then
	echo "GitHub repository name could be specifyed as parametr"
	read -p "Enter reporitory name for creation: " var
   else
	var=$1
fi


# caling main .sh script
/c/Users/BFG/Scripts/Bash/github_new_java_repo.sh $var /c/Users/BFG/Projects/github_token.txt