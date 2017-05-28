#!/bin/bash

      COUNT=1
         while [  $COUNT -lt 3 ]; do
        TEMP="/centosInspec/"$COUNT"_spec.rb";
         cmd=$(inspec exec $TEMP | grep "1 failures")
         logger "Temp: "$TEMP
         #logger "CMD: "$cmd
                        if [ -n "$cmd" ]; then
                    #Basically means if there is a failure, execute below
                     #echo $cmd
                    #echo "There is a failure"
                    cmd=$( inspec exec $TEMP )
                    echo $cmd >> /home/centos/failreport.txt
                    #logger "CMD2: "$cmd
                        else
                #Basically means if there is a success, execute below
                    echo "Successful"
                    logger Successful
                    fi
            
              let COUNT=COUNT+1 
         done

report=$(ls /home/centos/ | grep failreport.txt)
logger "Report: "$report
if [ -n "$report" ]; then
                    #Basically means if the fail report was created, execute below
                     echo "Report found"
                   logger Report inspec failures on system $( hostname)
                        else
                #Basically means if there is a success, execute below
                    echo "All Successful"
                    logger All Successful
                    fi