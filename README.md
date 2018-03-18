Eventviewer - Security log failed login count

The following script examines an extracted eventviewer- security log for failed login attempts.

To extract the security lof from eventviewer open event viewer right click the security log and expert
Be sure to export as a .xml file format

Extract the log file from a domain controller for failed domain login attempts

This tools extracts event ID 4625 which is for failed logins, It then sorts the list into unique users and then the count for each attempt

Usage:
./eventsec.sh <filename>

Tested in windows 2008r2
