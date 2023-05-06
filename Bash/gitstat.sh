#!/bin/bash
dir=$1
if [[ $dir == "" ]]; then
 echo "Directory is required!"
 exit
fi

# first fetch, then chech ststus using diff
echo "In repo'$dir' :"
echo "fetching..."
git --git-dir=$dir/.git --work-tree=$dir fetch -v
echo ""
echo "diff..."
git --git-dir=$dir/.git --work-tree=$dir diff --stat
echo ""
echo "status..."
git --git-dir=$dir/.git --work-tree=$dir status
echo ""
echo ------