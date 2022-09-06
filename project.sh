#!/bin/bash
#install app you needed
function STAGE1()
{
sudo apt update
git clone https://github.com/htrgouvea/nipe && cd nipe
cd nipe
sudo cpan install Try::Tiny Config::Simple JSON
sudo perl nipe.pl install
#sudoapt-get install perl
sudo perl nipe.pl start
sudo apt-get  install openssh-server
sudo apt-get install curl
sudo apt-get install nmap
sudo apt-get install whois
sudo apt-get install sshpass
sudo apt-get install cmatrix
}
STAGE1

#check ip
function STAGE2()
{
	cmatrix -s
	place=$(whereami --f human)
	#sudo perl nipe.pl status
	sudo perl nipe.pl status
	echo "your new  ip is:"
	curl -s https://www.whatismyip.com/|grep class | tail -n4| head -n2|cut -d":" -f4| cut -d"<" -f1
	echo "your new place is:"
	if [[ $place == "Israel" ]];
	then
	echo "U R not Anonimus"
	STAGE1
	else
	echo "U R Anonimus"
	fi
}
STAGE2

function STAGE3()
{
	echo "what is the IP you want to connect to?"
	read IP
	sleep 3
	echo "What is the UserName?"
	read UserName
	sleep 3
	echo "What is the password?"
	read password
	sleep 3
	whois $IP ;nmap $IP
	echo "type wanted ssh port"
	read port
	#sshpass -p $password
	ssh -p $port $UserName"@"$IP

}
STAGE3
