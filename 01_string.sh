#!/bin/bash

myStr="Jishnu you are going to be a billionare"

myStrlen=${#myStr}
echo "Length of my string ${myStrlen}"

echo "Uppser case is ${myStr^^}"
echo "Lower case is ${myStr,,}"

#To replace a string
newWrd="trillionare"
newStr=${myStr/billionare/${newWrd}}
echo "${newStr^^}"

# Slicing a string

echo "${myStr:6:9}"
