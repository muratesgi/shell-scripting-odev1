#Sistemdeki tum kullanicilarin home dizini yedekleyecek, yedek dosyasinin ismi kullanicinin ismi ve yedekleme tarihi ve saati olacak. 
#Yedekleme dizini /mnt olacak; bu bir degiskene atanmali yine ayni dizinde yedekleme dosyasinin md5 dogrulama dosyasi olmali. 
#Yedekleme her gun saat 23:05 gece otomatik yapilmali. /tmp dizini altinda bu scriptin en son ne zaman calistigina dair bir log dosyasi olusturun.

#!/bin/bash
DATE=$(date +%d-%m-%Y)
USERS='ls /home | xargs -r'
BACKUP_DIR="/mnt/backup"
for user in $USERS; do
    tar -czf $BACKUP_DIR/$user-$DATE.tar.gz /home/$user
done

05 23 * * * /home/yedekleme_odevi/backup.sh

LOGFILE=”backup-$DATE.log” > /mnt 
echo "$LOGFILE" 