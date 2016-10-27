#!/bin/bash 

#--------------------------------------------------------
# Checks branch and hash of git directories in a folder.
#--------------------------------------------------------
# To use:
# chmod +x check-branch.sh
#
# For current branch
# ./check-branch.sh
#
# or for path
# ./check-branch.sh <path>
#--------------------------------------------------------


# Check for parameter and change directory
if ! [ $# -eq 0 ]; then

  # Strip trailing slash
  path_name=${1%/}
  if ! [ -d $path_name ]; then
    echo "Path $path_name not found!!"
    exit
  fi

  cd $path_name
fi

pwd $path_name

# Loop through all files
for f in *; do

  # Check for git directories
  if [ -d $f ] && [ -d $f"/.git" ] ; then
    echo
    echo "$f"
    git -C $f rev-parse --abbrev-ref HEAD
    git -C $f rev-parse --short HEAD
  fi
done
