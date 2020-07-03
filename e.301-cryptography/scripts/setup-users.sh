#!/bin/bash
#!/bin/sh
for i in `more userlist `
do
	echo $i
	id -u $i	
	if [ $? == 0 ]; then
		sudo deluser --remove-home $i
	fi
		sudo useradd -m -p 'shCVsunge4zfk' -s /bin/bash $i 
		sudo rsync -avr --chown=$i:$i  /home/d4/enforce/ /home/$i/enforce/
		sudo rsync -avr --chown=$i:$i  /home/d4/.ssh /home/$i/
		sudo -u $i ln -sr /home/$i/enforce/trainings/e.301-cryptography/hands-on-support /home/$i/hands-on
		sudo -u $i pushd /home/$i/enforce/
        sudo -u $i /home/$i/enforce/trainings/e.301-cryptography/hands-on-support/GPGsessions/setup/setup.sh
done
