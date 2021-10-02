#!/bin/bash

for x in $(ls -t *.Rmd)
do 
    if [ ! $(grep -l ${x%Rmd} .gitignore) ]
    then
       if [ "$x" -nt "${x%Rmd}slides.html" ]
       then
           echo "${x%Rmd}slides.html"
       fi
    fi
done
   

