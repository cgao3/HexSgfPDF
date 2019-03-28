#!/bin/bash


for entry in *.tex ; do
    pdflatex $entry
done

for entry in *.aux ; do 
    rm $entry
done

for entry in *.log ; do 
    rm $entry
done

