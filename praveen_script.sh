#!/bin/bash
PS3='Please enter your choice: '
options=("Change Password" "See The Disk Space" "Login Other Machine Through SSH" "Show all service Running" "Show all Ports Opened" "Show All java apps Running" "Facility to Kill App" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Change Password")
            echo "Starting Password Changing Script"
	    echo "Enter The User Name"
	    read Name
	    passwd $Name
            ;;
        "See The Disk Space")
            echo "Disk Space "
		df -h
            ;;
        "Login Other Machine Through SSH")
            echo "Enter The IP/Host Name"
	    read Name
	    ssh $Name
            ;;
        "Show all service Running")
	    echo "Service Running In The system"
	    service --status-all |grep "running"
	    ;;
	"Show all Ports Opened")
            echo "Opened Ports are"
	    netstat -n
	    ;;
	"Show All java apps Running")
	    echo "Java Apps Runnig"
	    ps aux | grep java
          ;;
	 "Facility to Kill App")
          echo "Enter the process ID"
	     read ID
	     pkill -9 $ID
          ;; 
        "Quit")
            break
            ;;
        *) echo invalid option;;
    esac
done
