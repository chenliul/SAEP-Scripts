#!/bin/sh

homedir="/var/jenkins_home/workspace/SAEP-automation01"

date=`date`
echo "********** Script Started: $date **********" > $homedir/results/tar.out

count=0
#while true 
#do
STARTTTIME1=`date | awk '{print $4}' | awk -F":" '{print $1}'`
STARTTTIME2=`date | awk '{print $4}' | awk -F":" '{print $2}'`
STARTTTIME3=`date | awk '{print $4}' | awk -F":" '{print $3}'`
	#clear
	if [ -d "trial" ]
	then
	  echo ""
	else
	  mkdir trial
	fi

    count=`expr $count + 1`
    echo "Running tar: iteration $count in trial/"
    tar cvf trial/tar_${count}.tar usr/bin >/dev/null 2>&1 </dev/null &
    tar xvf trial/tar_${count}.tar >/dev/null 2>&1 </dev/null &
    rm -rf trial/tar*
ENDTTIME1=`date | awk '{print $4}' | awk -F":" '{print $1}'`
ENDTTIME2=`date | awk '{print $4}' | awk -F":" '{print $2}'`
ENDTTIME3=`date | awk '{print $4}' | awk -F":" '{print $3}'`
TTR1=`expr $ENDTTIME1 - $STARTTTIME1 | sed 's/-//g'`
TTR2=`expr $ENDTTIME2 - $STARTTTIME2 | sed 's/-//g'`
TTR3=`expr $ENDTTIME3 - $STARTTTIME3 | sed 's/-//g'`
echo "Time To Run Iteration $count: ${TTR1}h,${TTR2}m,${TTR3}s" >> $homedir/results/tar.out

#sleep 60
#done