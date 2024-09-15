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
# 1.0     || 13-Sep-2024  || Vijay Patil      || Initial Version
##############################################################################################

# Function to display usage
usage() {
  echo "---------------------------------------------------------------"
  echo "usage: $SCRIPT_NAME SOURCE_DIR BACKUP_DIR"
  echo "SOURCE_DIR : /home/vijay (Madatory)"
  echo "BACKUP_DIR : /home/vijay.bkp (Madatory)"
  echo "Example : $SCRIPT_NAME /home/vijay /home/vijay.bkp"
  echo "---------------------------------------------------------------"
  EXIT_CODE=1
  exit $EXIT_CODE
}
EXIT_CODE=1

log(){
LOG_FILE="$log/$0_`date +%Y%m%d_%H%M%S`.log"
}

input_validation(){
echo "Info: Input Validation Started" | tee -a $LOG_FILE
# Check if the correct number of arguments is provided
if [ "$#" -ne 2 ]; then
    usage
fi

SOURCE_DIR=$1
DEST_DIR=$2

# Validate source directory
if [ ! -d "$SOURCE_DIR" ]; then
    echo "Error: Source directory $SOURCE_DIR does not exist." | tee -a $LOG_FILE
    EXIT_CODE=1
    exit $EXIT_CODE
else
        echo "Info: Source directory $SOURCE_DIR exist" | tee -a $LOG_FILE
fi

# Validate destination directory
if [ ! -d "$DEST_DIR" ]; then
    echo "Error: Destination directory $DEST_DIR does not exist." | tee -a $LOG_FILE
    usage
else
        echo "Info:  Destination directory $DEST_DIR exist." | tee -a $LOG_FILE
fi

# Check write permissions for destination directory
if [ ! -w "$DEST_DIR" ]; then
    echo "Error: No write permission for destination directory $DEST_DIR." | tee -a $LOG_FILE
    EXIT_CODE=1
    exit $EXIT_CODE
fi

}

backup(){
        echo "Info: Backup Started from $Source_DIR to $DEST_DIR."
# Copy files from source to destination
cp -r "$SOURCE_DIR"/* "$DEST_DIR" 2>>$LOG_FILE
if [ $? -ne 0 ]; then
    echo "Error: Failed to copy files from $SOURCE_DIR to $DEST_DIR." | tee -a $LOG_FILE
    EXIT_CODE=1
    exit $EXIT_CODE

else
        echo "Info: Copying files from $SOURCE_DIR to $DEST_DIR" | tee -a $LOG_FILE
fi

# Compress the copied files
gzip -fr "$DEST_DIR" 2>>$LOG_FILE
if [ $? -ne 0 ]; then
    echo "Error: Failed to compress files in $DEST_DIR." | tee -a $LOG_FILE
    EXIT_CODE=1
    exit $EXIT_CODE
else
        echo "Info: Files are are compressed in $DEST_DIR" | tee -a $LOG_FILE
fi

# Log success
echo "Info: Backup completed successfully from $SOURCE_DIR to $DEST_DIR." | tee -a $LOG_FILE
}
main (){
log
input_validation $1 $2
backup
}
    main $1 $2
    EXIT_CODE=0
    trap 'echo "Script is exited with exit code $EXIT_CODE"' EXIT | tee -a $LOG_FILE
    exit $EXIT_CODE
