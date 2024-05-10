#!/bin/bash

###############################################################################################
# Name: auto_backup.sh 
#-------------------------------------------------------------------------------------------
# OVERVIEW: This script is created to automate the backup and compression of a directory.
#-------------------------------------------------------------------------------------------
# HISTORY
#-------------------------------------------------------------------------------------------
# VERSION || DATE         || AUTHOR           || COMMENTS
#---------||--------------||------------------||--------------------------------------------
# 1.0     || 29-Sep-2023  || Vijay Patil      || Initial Version
# 2.0     || 11-Nov-2023  || Vijay Patil      || Modify the script to accept the source directory and backup directory as 
#                                                parameters ($1 and $2) from the user. This way, the script can be used to 
#						 back up any directory specified by the user.
# 3.0     || 15-Jan-2024  || Vijay Patil      || Added a usage function to prompt the user for the correct input format.
#-------------------------------------------------------------------------------------------
###############################################################################################

# PURPOSE : This function is used to prompt the user the correct input format
SCRIPT_NAME=`basename $0`
usage()
{
  echo "---------------------------------------------------------------"
  echo "usage: $SCRIPT_NAME SOURCE_DIR BACKUP_DIR"
  echo "SOURCE_DIR : /home/vijay"
  echo "BACKUP_DIR : /home/vijay.bkp "
  echo "Example : $SCRIPT_NAME /home/vijay /home/vijay.bkp"
  echo "---------------------------------------------------------------"
  EXIT_CODE=1
  exit $EXIT_CODE
}
#--MAIN-------------------------------------

#
#-------------------------------------------------------------------------------------------
###############################################################################################

if [ $# -eq 2 ]
then
 #The source directory to be backed up
 source_dir=$1
 #The backup directory destination
 backup_dir=$2
else 
 EXIT_CODE=1
 usage
fi

#If source directory is not present 
if [[ ! -d "$source_dir" ]]
then
 echo "The $source_dir is not present. Please provide the correct directory."
 EXIT_CODE=1
 exit $EXIT_CODE
fi

#If the backup directory is not present
if [[ ! -d "$backup_dir" ]]
then
    mkdir -p "$backup_dir"
fi
# copy the source directory to the backup directory
cp -r "$source_dir" "$backup_dir"
#Compress the backup directory
gzip -r "$backup_dir"
