#!/bin/bash
#==============================================#
#     Caligula's terminal replayer script.     #
#==============================================#


printf "\n"
while true
do
    read -p "  Replay or Cat terminal session? [r/c/q]: " answer
    case $answer in
    [rR]* ) read -p "  Filename to replay (leave unappended): " name
            filename=~/terminalrecordings/$name"_record.txt"
            timingfile=~/terminalrecordings/$name"_timing.txt"
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
            filename=~/terminalrecordings/$name"_record.txt"
            timingfile=~/terminalrecordings/$name"_timing.txt"
            printf "\n"
            cat $filename
            printf "\n"
            exit;;
    [qQ]* ) printf "\n"
            exit;;
    * )     echo "  Enter Record, Cat, or Quit.";;
    esac
done
