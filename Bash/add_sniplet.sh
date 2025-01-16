#!/bin/bash


add_sniplet() {

    local position=$1
    echo position=$position
    local sniplet=$2
    echo sn=$sniplet
    local src_file=$3
    echo src=$src_file
    local out_file=$4
    echo out=$out_file


    if [ -z "$1" ]; then
        echo "Empty arguments!"
        echo "add_snipl inserts text into selected line number of the sourse file ond save result to output file "
        echo "Usage: add_sniplet <line number to inset text> <text> <path/to/source> (optional <path/to/output>)"
        return 1
    fi

    if [ -z "$position" ]; then
        position="1"
        echo position=$position

    elif [[ ! $position == *[0-9] ]]; then
        echo position $position not right!
        return 1
    fi

    if [ ! -f "$src_file" ]; then
        echo "bad sourse file $src_file"
        return 1
    fi

    if [ -z "$out_file" ]; then
        cat $src_file > snipl.tmp
        sed "${position}i\\$sniplet" "snipl.tmp">"$src_file"
        rm snipl.tmp
    else
        sed "${position}i\\$sniplet" "$src_file">"$out_file"
    fi
}


# PAS="test"
# p=$PAS
# echo "${p//'$PAS'/$PAS}"

# - test of two line string content
# add_sniplet 8 "one \n\
# two" ./3.txt ./5.txt

# - find last line of a file


# all=$(wc -l "./1.txt")
# last_line=${all%% *}


#let "last_line+=1"
# # - test of a tail command
# tail -n +3 3.txt >4.txt


# _add_sniplet "$line_number" \
#         "    \"terminal.integrated.profiles.windows\":\ {\"Git\ Bash\":\ {\"path\":\
# \ \"\${env:USERPROFILE}\\\\\\\\DevTools\\\\\\\\PortableGit\\\\\\\\bin\\\\\\\\bash.exe\"},\ },\n\
#     \"terminal.integrated.defaultProfile.windows\":\"Git\ Bash\"" \
#         "$SRC_VSC/_user_settings.json" \
#         "$INSTALLDIR/$VSCHOME/data/user-data/User/settings.json"
# echo


add_sniplet "3" \
        "    \"terminal.integrated.profiles.windows\":\ {\"Git\ Bash\":\ {\"path\":\
\ \"\${env:USERPROFILE}\\\\\\\\DevTools\\\\\\\\PortableGit\\\\\\\\bin\\\\\\\\bash.exe\"},\ },\n\
    \"terminal.integrated.defaultProfile.windows\":\"Git\ Bash\"" \
        "1.txt" \
        "2.txt"


# # save source file to temp, we can not nodify source and save to it ot one time
# cat 1.txt >.tmp
# # content from tmp is modifyed and saved to source file
# add_sniplet "export\ NUGET_PACKAGES=/mnt/d/packages/nuget\n\
# export\ npm_config_cache=/mnt/d/packages/npm\n\
# export\ YARN_CACHE_FOLDER=/mnt/d/packages/npm\n\
# export\ PIP_CACHE_DIR=/mnt/d/packages/pip\n\
# export\ MAVEN_OPTS=\"-Dmaven.repo.local=/mnt/d/packages/maven\ %MAVEN_OPTS%\"\n\
# export GRADLE_USER_HOME=/mnt/d/packages/gradle" ./.tmp ./1.txt 2
# # remove temt file
# rm .tmp

exit 0