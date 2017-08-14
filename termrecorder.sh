#!/bin/bash
#==============================================#
#     Caligula's terminal recorder script.     #
#==============================================#


printf "\n"
while true
do
    read -p "  Record terminal session? [y/n]: " answer
    case $answer in
    [yY]* ) read -p "  Filename to record to (will be appended): " name
            filename=~/terminalrecordings/$name"_record.txt"
            touch $filename
            timingfile=~/terminalrecordings/$name"_timing.txt"
            touch $timingfile
            printf "\n"
            echo "  Record filename is: " $filename
            echo "  Timing filename is: " $timingfile
            printf "\n"
            echo "  Now recording, type 'exit' when finished."
            timestamp=$(date +%Y/%m/%d)' '$(date +%H:%M:%S)
            echo "  Timestamp:" $timestamp
            printf "\n"
            script -q -a $filename --timing=$timingfile
            break;;
    [nN]* ) printf "\n"
            exit;;
    * )     echo "  Enter Yes or No.";;
    esac
done
