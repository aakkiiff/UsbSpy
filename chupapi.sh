if [ -z "$(lsblk -o RM,MOUNTPOINTS| grep media | grep '\s1\s' | awk '{print $NF}')" ]; then :
else
#EXTRACT THE LOCATION OF INSERTED USB DRIVE
LOCATION=$(lsblk -o RM,MOUNTPOINTS| grep media | grep '\s1\s' | awk '{print $NF}')
TARGET_PATH=~/Desktop/UsbChupapi
#RUN EVERY 30 MIN #will make a cron job for this
#NAME THE DIRECTORY
NAME=$(date +%Y-%m-%d_%H:%M)_backup

#CHECK IF DIR EXISTS
if [ -d $TARGET_PATH/$NAME ]; then	
	:
else
	echo  "Directory does not exist"
	mkdir $TARGET_PATH/$NAME
	#COPY THE FILES TO THE DIR
	cp -r $LOCATION $TARGET_PATH/$NAME
fi
fi



