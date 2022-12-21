#!/bin/bash

# Set the PHP-FPM log file path
log_file="/var/log/php-fpm/error.log"

# Set the PHP-FPM configuration file path
config_file="/etc/php/7.4/fpm/php-fpm.conf"

# Check the PHP-FPM log files for any error messages
echo "Checking PHP-FPM log files for errors..."
errors=$(grep -i "error" $log_file)
if [ -z "$errors" ]
then
    echo "No errors found in PHP-FPM log files."
else
    echo "Errors found in PHP-FPM log files:"
    echo "$errors"
fi

# Check the PHP-FPM configuration files for any issues or misconfigurations
echo "Checking PHP-FPM configuration files for issues or misconfigurations..."
issues=$(grep -i "error" $config_file)
if [ -z "$issues" ]
then
    echo "No issues or misconfigurations found in PHP-FPM configuration files."
else
    echo "Issues or misconfigurations found in PHP-FPM configuration files:"
    echo "$issues"
fi

# Check the PHP-FPM process list to see if it is running and gather information about its resource usage
echo "Checking PHP-FPM process list..."
process_list=$(ps aux | grep [p]hp-fpm)
if [ -z "$process_list" ]
then
    echo "PHP-FPM is not running."
else
    echo "PHP-FPM is running:"
    echo "$process_list"
    echo "Resource usage:"
    top -b -n 1 | grep [p]hp-fpm
fi

# Check the PHP-FPM resource utilization
echo "Checking PHP-FPM resource utilization..."
top -b -n 1 | grep [p]hp-fpm

# Check for any external issues that may be affecting PHP-FPM
echo "Checking for any external issues that may be affecting PHP-FPM..."
echo "Network connectivity:"
ping -c 4 8.8.8.8
echo "Traceroute to 8.8.8.8:"
traceroute 8.8.8.8
