**Overview**

Backup_Automation.ksh is a shell script designed to automate the backup and compression of a specified directory. It validates input directories, copies files from the source to the destination, compresses the copied files, and logs all actions and errors.

**Features**

Input Validation: Ensures the provided source and destination directories are valid and accessible.
File Copying: Uses the cp command to copy files from the source to the destination directory.
Compression: Compresses the copied files using gzip.
Error Handling: Logs errors and exits with appropriate codes if issues are encountered.
Logging: Creates a log file to record all actions and errors.
Exit Codes: Exits with code 0 if successful, or with an appropriate error code if an issue occurs.

**Usage**

Backup_Automation.ksh SOURCE_DIR BACKUP_DIR

**Arguments**

SOURCE_DIR: The directory to be backed up (e.g., /home/vijay).
BACKUP_DIR: The directory where the backup will be stored (e.g., /home/vijay.bkp).
Example
Backup_Automation.ksh /home/vijay /home/vijay.bkp

**Script Details**

**Functions**

usage(): Displays usage information and exits with code 1.
log(): Initializes the log file.
input_validation(): Validates the source and destination directories.
backup(): Copies files from the source to the destination and compresses them.

**Main Execution**

The script starts by calling the log, input_validation, and backup functions in sequence. It sets a trap to log the exit status upon script termination.

**Contributing**

Feel free to suggest improvements or report issues through GitHub pull requests.
