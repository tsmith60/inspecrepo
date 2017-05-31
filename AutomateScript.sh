#!/bin/bash

      COUNT=1
         while [  $COUNT -lt 3 ]; do
        TEMP="/inspecrepo/"$COUNT"_spec.rb";
         cmd=$(inspec exec $TEMP | grep "1 failures")
         logger "Temp: "$TEMP
         #logger "CMD: "$cmd
                        if [ -n "$cmd" ]; then
                    #Basically means if there is a failure, execute below
                     #echo $cmd
                    #echo "There is a failure"
                    cmd="Inspec Policy #$COUNT: \n"$( inspec exec $TEMP )"\n\n"
                    echo -e $cmd >> /home/centos/failreport.txt
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
                   sudo shutdown -h now
                        else
                #Basically means if there is a success, execute below
                    echo "All Successful"
                    logger All Successful
                    fi
