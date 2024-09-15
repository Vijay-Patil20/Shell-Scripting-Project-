**Overview**

disk_space_monitor.sh is a shell script designed to monitor the free space of a specified disk and send an email alert if the free space falls below a specified threshold. This script is useful for system administrators who need to ensure that their systems do not run out of disk space.

**Features**

Threshold Monitoring: Monitors the free space of disk sda1 and sends an alert if the free space is below the specified threshold.

Email Alerts: Sends email notifications to a list of recipients when the disk space is low.

Logging: Logs all actions and errors to a log file for auditing and troubleshooting.

**Usage**

./disk_space_monitor.sh

**Arguments**

This script does not require any arguments. It uses predefined global variables for configuration.

**Example**

./disk_space_monitor.sh

**Configuration**

THRESHOLD: The percentage of free space below which an alert is triggered. Default is 90.
MAIL_LIST: The file containing the list of email addresses to send alerts to. Default is /home/vijay/pr/FileSystem/mails.

**Script Details**

**Functions**

usage(): Displays usage information and exits with code 1.
log(): Initializes the log file with a timestamp.
input_validation(): Validates the existence of the mail list file.
monitor_disk_space(): Monitors the disk space of sda1 and sends an email alert if the free space is below the threshold.

**Main Execution**

The script starts by calling the log, input_validation, and monitor_disk_space functions in sequence. It sets a trap to log the exit status upon script termination.

**Contributing**

Feel free to suggest improvements or report issues through GitHub pull requests.
