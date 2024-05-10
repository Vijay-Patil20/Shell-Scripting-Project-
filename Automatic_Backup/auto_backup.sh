#!/bin/bash

###############################################################################################
# Name:auto_backup.sh 
#-------------------------------------------------------------------------------------------
# OVERVIEW: This script is created for automate the backup ad compression of a diretory.
#-------------------------------------------------------------------------------------------
# HISTORY
#-------------------------------------------------------------------------------------------
# VERSION || DATE         || AUTHOR           || COMMENTS
#---------||--------------||------------------||--------------------------------------------
# 1.0     || 29-sEP-2023  || Vijay Patil      || Initial Version
#
#-------------------------------------------------------------------------------------------
###############################################################################################

#The source directoy to be backed up
source_dir="/home/vijay/test"

#The backup directory destination
backup_dir="/home/vijay/test.backup"

#If the backup directory is not exits
if [[ ! -d "$backup_dir" ]]
then
    mkdir -p "$backup_dir"
fi
# copy the source directory to the backup directory
cp -r "$source_dir" "$backup_dir"
#Compress the backpup directory
gzip -r "$backup_dir"
