#!/bin/sh
echo "Do you want to update Script type yes or no"
read ans
$a=ans
if ["$a" -ne "yes"]; then
  echo "update"
else
  echo "Please type yes or no"
fi
