#! /bin/bash
#
#
# Command to delete files from a directory except a few files
setopt extendedglob
rm -- ^(file1|file2) # file1 and file2 are the names of files that you have to exclude. For example: file1 and file2 can be test.py, script.py, script.txt
