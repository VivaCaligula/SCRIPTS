#!/bin/bash
#=====================================#
#     Caligula's auto-git script.     #
#=====================================#

git pull origin master
printf "\n"
git add *
printf "\n"
git commit -m "auto-git script"
printf "\n"
git push origin master
