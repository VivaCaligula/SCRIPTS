#!/bin/bash
#==============================================#
#     Caligula's terminal replayer script.     #
#==============================================#


if [ ! -d ~/TermRecordings ]; then
    echo -e "\n  The TermRecordings directory does not exist, no file can be replayed.\n"
    exit
fi

printf "\n"
while true
do
    read -p "  Replay or Cat terminal session? [r/c/q]: " answer
    case $answer in
    [rR]* ) read -p "  Filename to replay (leave unappended): " name
            filename=~/TermRecordings/$name"_record.txt"
            timingfile=~/TermRecordings/$name"_timing.txt"
            printf "\n"
            echo "  Record filename is: " $filename
            echo "  Timing filename is: " $timingfile
            printf "\n"
            echo "  Now replaying."
            printf "\n"
            scriptreplay $filename --timing=$timingfile
            echo "  Replay finished."
            printf "\n"
            break;;
    [cC]* ) read -p "  Filename to concatenate (leave unappended): " name
            filename=~/TermRecordings/$name"_record.txt"
            timingfile=~/TermRecordings/$name"_timing.txt"
            printf "\n"
            cat $filename
            printf "\n"
            exit;;
    [qQ]* ) printf "\n"
            exit;;
    * )     echo "  Enter Record, Cat, or Quit.";;
    esac
done
