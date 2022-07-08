#!/bin/bash
YEL=$'\e[1;33m'
RED=$'\033[0;31m'
NC=$'\033[0m' # No Color
PRPL=$'\033[1;35m'
GRN=$'\e[1;32m'
BLUE=$'\e[3;49;34m'

printf "${BLUE}\n"
echo '██╗  ██╗██████╗  █████╗ ███████╗███████╗'
echo '██║ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝'
echo '█████╔╝ ██████╔╝███████║███████╗███████╗'
echo '██╔═██╗ ██╔═══╝ ██╔══██║╚════██║╚════██║'
echo '██║  ██╗██║     ██║  ██║███████║███████║'
echo '╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝'
printf "\nPowered by KeepSec Technologies Inc.™\n"
printf "${NC}\n\n"

printf "${GRN}This script must be run with 'autoexpect' (see https://github.com/KeepSec-Technologies/KPass)${NC}\n\n"
sleep 0.5

sudo mkdir /root/.kpass &> /dev/null
cd /root/.kpass &> /dev/null

function installing {
  tput civis
  spinner="⣾⣽⣻⢿⡿⣟⣯⣷"
  while :
  do
    for i in `seq 0 7`
    do
      printf "${PRPL}${spinner:$i:1}"
      printf "\010${NC}"
      sleep 0.2
    done
  done
}

installing &
SPIN_PID=$!
disown
printf "${PRPL}\nInstalling utilities ➜ ${NC}"

if [ -n "`command -v apt-get`" ];

then sudo apt-get -y install perl > /dev/null && curl https://sh.rustup.rs -sSf &> /dev/null | sh -s -- -y &> /dev/null && sudo apt-get -y install cargo &> /dev/null;

elif [ -n "`command -v yum`" ]; 

then sudo yum -y install perl > /dev/null && curl https://sh.rustup.rs -sSf &> /dev/null | sh -s -- -y &> /dev/null && sudo yum -y install cargo &> /dev/null;

else 

printf "\n${RED}Your Linux distro is not supported, only RHEL-based and Debian-based is supported at the moment${NC}\n"

exit

fi

kill -9 $SPIN_PID &> /dev/null
tput cnorm
echo ""

#user to set the password for
echo ""
echo ""
read -p "What is the ${YEL}user${NC} that you want to use that script for : " User1
echo ""
printf "${RED}Absolutely do NOT lose the passwords you will put in right now${NC}\n\n"
sleep 1

read -s -p "What is the password that you want for ${YEL}Monday${NC} : " passwd1
echo ""
echo ""
read -s -p "What is the password that you want for ${YEL}Tuesday${NC} : " passwd2
echo ""
echo ""
read -s -p "What is the password that you want for ${YEL}Wednesday${NC} : " passwd3
echo ""
echo ""
read -s -p "What is the password that you want for ${YEL}Thursday${NC} : " passwd4
echo ""
echo ""
read -s -p "What is the password that you want for ${YEL}Friday${NC} : " passwd5
echo ""
echo ""
read -s -p "What is the password that you want for ${YEL}Saturday${NC} : " passwd6
echo ""
echo ""
read -s -p "What is the password that you want for ${YEL}Sunday${NC} : " passwd7
echo ""
echo ""

#salt is randomly generated with the variable pepper
pepper=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 13)
salt1=$(echo ${pepper})
salt2=$(echo ${pepper})
salt3=$(echo ${pepper})
salt4=$(echo ${pepper})
salt5=$(echo ${pepper})
salt6=$(echo ${pepper})
salt7=$(echo ${pepper})

#generate hashes through perl
hash1=$(perl -e 'print crypt($ARGV[1], "\$" . $ARGV[0] . "\$" . $ARGV[2]), "\n";' "6" "$passwd1" "$salt1")
hash2=$(perl -e 'print crypt($ARGV[1], "\$" . $ARGV[0] . "\$" . $ARGV[2]), "\n";' "6" "$passwd2" "$salt2")
hash3=$(perl -e 'print crypt($ARGV[1], "\$" . $ARGV[0] . "\$" . $ARGV[2]), "\n";' "6" "$passwd3" "$salt3")
hash4=$(perl -e 'print crypt($ARGV[1], "\$" . $ARGV[0] . "\$" . $ARGV[2]), "\n";' "6" "$passwd4" "$salt4")
hash5=$(perl -e 'print crypt($ARGV[1], "\$" . $ARGV[0] . "\$" . $ARGV[2]), "\n";' "6" "$passwd5" "$salt5")
hash6=$(perl -e 'print crypt($ARGV[1], "\$" . $ARGV[0] . "\$" . $ARGV[2]), "\n";' "6" "$passwd6" "$salt6")
hash7=$(perl -e 'print crypt($ARGV[1], "\$" . $ARGV[0] . "\$" . $ARGV[2]), "\n";' "6" "$passwd7" "$salt7")


#password to set for each day
Monday1=$(echo ${hash1})
Tuesday1=$(echo ${hash2})
Wednesday1=$(echo ${hash3})
Thursday1=$(echo ${hash4})
Friday1=$(echo ${hash5})
Saturday1=$(echo ${hash6})
Sunday1=$(echo ${hash7})

#get the date
whichday=$(date +"%A")

if [ $whichday == "Monday" ]; then
  usermod -p $Monday1 $User1
elif [ $whichday == "Tuesday" ]; then
  usermod -p $Tuesday1 $User1
elif [ $whichday == "Wednesday" ]; then
  usermod -p $Wednesday1 $User1
elif [ $whichday == "Thursday" ]; then
  usermod -p $Thursday1 $User1
elif [ $whichday == "Friday" ]; then
  usermod -p $Friday1 $User1
elif [ $whichday == "Saturday" ]; then
  usermod -p $Saturday1 $User1
elif [ $whichday == "Sunday" ]; then
  usermod -p $Sunday1 $User1
fi

sudo chmod +x script.exp &> /dev/null

croncmd="./script &> /dev/null"
cronjob="* 12 * * * $croncmd"

( crontab -l &> /dev/null | grep -v -F "$croncmd" ; echo "$cronjob" ) | crontab -

printf "${GRN}\nWe're done!\n${NC}"
echo ""

#run ( /root/.cargo/bin/rshc -f script.exp -o script.rs && rm -f script.rs script.exp.rs script.exp ) &> /dev/null after exit

exit