#!/bin/bash

# source_extensions=(.py .sh .bash .java .txt)
# TODO: Shouldn't need to include all this syntactic clutter when specifying 
# file extensions. But building up the string for find to use from just an array
# of extensions is shockingly difficult.
extflags=(\( -name '*.py' -o -name '*.sh' -o -name '*.bash' -o -name '*.java' -o -name '*.txt' \))
todo_flags='TODO|FIXME|XXX|HACK'

function echotodos {
    grepres=`grep -A 5 -E $todo_flags $1`
    if ! [[ -z $grepres ]]
    then
        echo $1
        echo
        echo "$grepres"
        echo
    fi
}

if [[ $# -lt 1 ]]
then
    echo "USAGE: todos.sh directory..."
    exit 1
fi

# We randomize the order of the directories passed in so that we're not always
# printing the same sequence of todos.
if which rl
then
    dirnames=`echo $* | rl -d ' '`
else
    dirnames=$*
    echo "WARNING: Can't randomize input directories because rl is not installed. To get it, try
        sudo apt-get install randomize-lines
        Handling dirs in order given." >&2
fi

for dir in $dirnames
do
    find "$dir" "${extflags[@]}" | while read f
    do
        echotodos "$f"
    done
done
