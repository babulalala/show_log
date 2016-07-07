#!/bin/bash
#
# Script:
# Description: Tail log for catalina.out or backup-restore.log
# Date: 2016.05.09
#

script_name=`basename $0 .sh`
script_full_name=`basename $0`

#default
log='/var/log/tomcat6/catalina.out'

show_help() {
	cat <<here
Usage: $scrip_full_name [-c|-b|-h]

Tail dcTrack related logs.

Options
N/A             Default log is catalina.out
-c		catalina.out
-b		backup-restore.log
-h              Show this help

Example
$script_full_name -b

Result
....
here

	exit 0
}

case $1 in
	-c) log='/var/log/tomcat6/catalina.out'
	;;
	-b) log='/var/log/oculan/backup-restore.log'
	;;
	-h) show_help
	;;
	*) ;;	#do nothing
esac

clear
date

cat <<here
$log
========================================
here

exec tail -f $log

## End of Script ##
