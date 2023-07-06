#
# Regular cron jobs for the resize-tiny package.
#
0 4	* * *	root	[ -x /usr/bin/resize-tiny_maintenance ] && /usr/bin/resize-tiny_maintenance
