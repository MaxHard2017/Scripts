#!/bin/bash

# internal function for checking dictinct repo
checkrepo () {
	dir=$1
	if [[ $dir == "" ]]
	 	then
		echo "Directory is required!"
		exit
	fi

	# first fetch, then check ststus using diff
	echo "In repo'$dir' :"
	echo "fetching..."
	git --git-dir=$dir/.git --work-tree=$dir fetch -v
	echo "diff..."
	git --git-dir=$dir/.git --work-tree=$dir diff --stat
	echo "status..."
	git --git-dir=$dir/.git --work-tree=$dir status
	echo ------
}

# check for no arguments
if [ $# -eq 0 ]
	then
	echo "No arguments supplied"
	exit 1
fi

# check for parameters
# перебираем все входные параметры пока не будет строки без - -- или *
# считаем, что это имя файла с путыми к репозиториям гит
while [ -n "$1" ]
do
    case "$1" in
	--) 
		shift
 	    continue ;;
	--file | -f) # если указан параметр то не проводим другие проверки	
		shift	 # берем следующее слово в передаваемых параметрах как путь и имя файла и выходим из цикла
		file=$1
		if [ -e $file ]
		then
			while IFS= read -r repo
			do
  				checkrepo $repo
			done < $file
		else 
			echo "file $file not found!"
			echo "for help type: ./checkallrepos.sh -h"
			exit 0
		fi
		break;;

	--help | -h) 
	    echo "HELP: checkallrepos.sh - for analyzing chages of in git repos"
	    echo "list of repos could be provided in file" 
	    echo "Usage: ./check_git_repos.sh  -f [life with repo paths]"
		echo "or ./check_git_repos.sh [path to repo]" 
	    exit 0;;

    *) 
		repo=$1 # если в параметрах передано слово не являющееся ниодним из параметров
			   # то считаем его путем к репозиторию для проверки
		break ;;
    esac
    shift
done

# check for file existance
if [ -d $repo ]
then
	checkrepo $repo
	exit 1
else
	echo "git repo $repo not found!"
	echo "for help type: ./check_git_repos.sh -h"
	exit 0
fi