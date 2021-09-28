#!/bin/bash

for x in *.Rmd
do 
   if [ "$x" -nt "${x%Rmd}slides.html" ]
   then
       echo "${x%Rmd}slides.html"
   fi
done
   

