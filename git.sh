#!/bin/bash
#=====================================#
#     Caligula's auto-git script.     #
#=====================================#

git pull origin master
git add *
git commit -m "auto-commit script"
git push origin master
