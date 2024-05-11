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
#
#-------------------------------------------------------------------------------------------
###############################################################################################

#The source directory to be backed up
source_dir="/home/vijay/test"

#The backup directory destination
backup_dir="/home/vijay/test.backup"

#If the backup directory is not present
if [[ ! -d "$backup_dir" ]]
then
    mkdir -p "$backup_dir"
fi
# copy the source directory to the backup directory
cp -r "$source_dir" "$backup_dir"
#Compress the backup directory
gzip -r "$backup_dir"
