##################################################################################################################################################
# Eventviewer v1 - Security log failed login count
# by Cyb3rB3an
# Twitter feed: @Cyb3rB3an 
#
# The following script exams and extracted eventviewer- security log for failed login attempts.
# To extract the security lof from eventviewer open event viewer right click the security log and expert
# Be sure to export as a .xml file format
#
# Extract the log file from a domain controller for failed domain login attempts
#
# This tools extracts the event ID 4625 which is for failed logins, It then sorts the list  unique users and then the count for each attempt
#
# Usage:
# ./eventsec.sh <filename>
#
# Tested in windows 2008r2
#
##################################################################################################################################################


# Checks file parameter is present 
if [ "$#" -ne 1 ]; then
    echo -e "\e[31m--------------------------------------"
    echo -e "Illegal number of parameters"
    echo -e "Format needs to be eventsec.sh <filename>"
    echo -e "--------------------------------------"

exit 0
fi

# reads filename
secinput=$1

echo -e "\e[32m----------------------------------"
echo -e "Event Viewer Security Log  Script"
echo -e "----------------------------------"
echo -e "\e[39m"


secextract=($(grep '<EventID>4625</EventID>' $secinput | cut -d "'" -f 25 | cut -d ">" -f 2 | cut -d "<" -f 1))
extracttotal=${#secextract[@]}

#sort list

echo -e "\e[32m--------------------------"
echo -e "    Count Name"
echo -e "--------------------------"
echo -e "\e[39m"

(IFS=$'\n'; sort <<< "${secextract[*]}") | uniq -c

echo "Do you want the date info for user ? (y/n)"
read userinput



if [ "$userinput" == "y" ]; then
echo "Enter username from list above"
read userdata
echo -e "\e[32m--------------------------------"
echo "Date/Time stamp for $userdata"
echo -e "--------------------------------"
echo -e "\e[39m"
cat $secinput | grep 4625 | grep $userdata | cut -d "'" -f 8
fi







