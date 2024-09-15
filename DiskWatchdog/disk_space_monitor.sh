#!/bin/bash

###############################################################################################
# Name: disk_space_monitor.sh
#-------------------------------------------------------------------------------------------
# OVERVIEW: This script monitors the free space of disk sda and sends an email alert if the
#           free space is less than a specified threshold.
#-------------------------------------------------------------------------------------------
# HISTORY
#-------------------------------------------------------------------------------------------
# VERSION || DATE         || AUTHOR           || COMMENTS
#---------||--------------||------------------||--------------------------------------------
# 1.0     || 15-Sep-2023  || Vijay Patil      || Initial Version
##############################################################################################

# Global variables
THRESHOLD=90
MAIL_LIST="/home/vijay/pr/FileSystem/mails"

# Function to display usage
usage() {
    echo "---------------------------------------------------------------"
    echo "Usage: $0"
    echo "This script monitors the free space of disk sda and sends an email alert if the free space is less than $THRESHOLD%."
    echo "---------------------------------------------------------------"
    exit 1
}

# Function to initialize the log file
log() {
    LOG_FILE="$log/$0_$(date +%Y%m%d_%H%M%S).log"
}

# Function to validate input directories
input_validation() {
    echo "Info: Input Validation Started" | tee -a $LOG_FILE

    # Validate mail list file
    if [ ! -f "$MAIL_LIST" ]; then
        echo "Error: Mail list file $MAIL_LIST does not exist." | tee -a $LOG_FILE
        exit 1
    else
        echo "Info: Mail list file $MAIL_LIST exists." | tee -a $LOG_FILE
    fi

}

# Function to monitor disk space
monitor_disk_space() {
    echo "Info: Monitoring disk space of sda1" | tee -a $LOG_FILE
    fs=$(df -H | grep -i "sda1" | awk '{print $5}' | tr -d '%')

    if [[ $fs -ge $THRESHOLD ]]; then
        while read -r to; do
            echo "Warning, disk space is low - $fs%" | mail -s "Disk Space Alert!" "$to"
            echo "Alert sent to $to" | tee -a $LOG_FILE
        done < "$MAIL_LIST"
    else
        echo "Disk space is $fs% which is under the $THRESHOLD" | tee -a $LOG_FILE
    fi
}

# Main function
main() {
    log
    input_validation
    monitor_disk_space
}
# Start execution
main
trap 'echo "Script exited with exit code $?" | tee -a $LOG_FILE' EXIT
