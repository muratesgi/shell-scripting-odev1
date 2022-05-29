#Bir script yazin, 
#bu script GNU/Linux sunucunuzun uzerinde dakika’da bir calissin ve makinadaki herhangi bir diskin yada partition'in kullanim orani %90’in uzerinde ise mail atsin.

#!/bin/sh
MYMAIL="mymail@google.com"
ALERT=90
df -H | grep -vE '^Filesystem|tmpfs|cdrom' | awk '{ print $5 " " $1 }' | while read output;
do
  echo $output
  usep=$(echo $output | awk '{ print $1}' | cut -d'%' -f1  )
  partition=$(echo $output | awk '{ print $2 }' )
  if [ $usep -ge $ALERT ]; then
    mail -s "Alert: Almost out of disk space $usep%" $MYMAIL
  fi
done