#!/bin/bash
YEL=$'\e[1;33m' # Yellow
RED=$'\033[0;31m' # Red
NC=$'\033[0m' # No Color
PRPL=$'\033[1;35m' # Purple
GRN=$'\e[1;32m' # Green
BLUE=$'\e[3;49;34m' # Blue

printf "${BLUE}\n"
echo '██╗  ██╗██████╗  █████╗ ███████╗███████╗'
echo '██║ ██╔╝██╔══██╗██╔══██╗██╔════╝██╔════╝'
echo '█████╔╝ ██████╔╝███████║███████╗███████╗'
echo '██╔═██╗ ██╔═══╝ ██╔══██║╚════██║╚════██║'
echo '██║  ██╗██║     ██║  ██║███████║███████║'
echo '╚═╝  ╚═╝╚═╝     ╚═╝  ╚═╝╚══════╝╚══════╝'
printf "\nPowered by KeepSec Technologies Inc.™${NC}\n\n"

#make and go to .kpass directory
chmod 700 $PWD/KPass.sh &>/dev/null
sudo mkdir $PWD/.kpass &>/dev/null
cd $PWD/.kpass &> /dev/null

#function for the installing wheel
function installing {
  tput civis
  spinner="⣾⣽⣻⢿⡿⣟⣯⣷"
  while :; do
    for i in $(seq 0 7); do
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

#install perl for the hash generation based on your package manager
if [ -n "$(command -v apt-get)" ]; then
  sudo apt-get -y install perl >/dev/null
elif [ -n "$(command -v yum)" ]; then
  sudo yum -y install perl >/dev/null
elif [ -n "$(command -v pacman)" ]; then
  sudo pacman -S foobar >/dev/null
fi

kill -9 $SPIN_PID &>/dev/null
tput cnorm
echo ""
echo ""
echo ""

#user confirmation
function confirmUser {

  read -p "What is the ${YEL}user${NC} that you want to use that script for : " User1
  echo ""
  grep1=$(grep -c $User1: /etc/passwd)
  userGrep="$(echo ${grep1})"

  if [[ $userGrep == 0 ]]; then
    printf "${RED}This user does not exist! Try again\n\n${NC}"

    sleep 0.5

    confirmUser

  fi

}

confirmUser

printf "${RED}Absolutely do NOT lose the passwords you're about to put in${NC}\n\n"
sleep 1

#password confirmation
function confirmPasswd1 {

  read -s -p "What is the password that you want for ${YEL}Monday${NC} : " passwd1
  echo ""
  echo ""
  read -s -p "Confirm your password : " truepasswd1
  echo ""
  echo ""
  if [[ $passwd1 != $truepasswd1 ]]; then
    printf "${RED}Passwords are different! Try again\n\n${NC}"

    sleep 0.5

    confirmPasswd1

  fi

}

function confirmPasswd2 {

  read -s -p "What is the password that you want for ${YEL}Tuesday${NC} : " passwd2
  echo ""
  echo ""
  read -s -p "Confirm your password : " truepasswd2
  echo ""
  echo ""
  if [[ $passwd2 != $truepasswd2 ]]; then
    printf "${RED}Passwords are different! Try again\n\n${NC}"

    sleep 0.5

    confirmPasswd2

  fi

}

function confirmPasswd3 {

  read -s -p "What is the password that you want for ${YEL}Wednesday${NC} : " passwd3
  echo ""
  echo ""
  read -s -p "Confirm your password : " truepasswd3
  echo ""
  echo ""
  if [[ $passwd3 != $truepasswd3 ]]; then
    printf "${RED}Passwords are different! Try again\n\n${NC}"

    sleep 0.5

    confirmPasswd3

  fi

}

function confirmPasswd4 {

  read -s -p "What is the password that you want for ${YEL}Thursday${NC} : " passwd4
  echo ""
  echo ""
  read -s -p "Confirm your password : " truepasswd4
  echo ""
  echo ""
  if [[ $passwd4 != $truepasswd4 ]]; then
    printf "${RED}Passwords are different! Try again\n\n${NC}"

    sleep 0.5

    confirmPasswd4

  fi

}

function confirmPasswd5 {

  read -s -p "What is the password that you want for ${YEL}Friday${NC} : " passwd5
  echo ""
  echo ""
  read -s -p "Confirm your password : " truepasswd5
  echo ""
  echo ""
  if [[ $passwd5 != $truepasswd5 ]]; then
    printf "${RED}Passwords are different! Try again\n\n${NC}"

    sleep 0.5

    confirmPasswd5

  fi

}

function confirmPasswd6 {

  read -s -p "What is the password that you want for ${YEL}Saturday${NC} : " passwd6
  echo ""
  echo ""
  read -s -p "Confirm your password : " truepasswd6
  echo ""
  echo ""
  if [[ $passwd6 != $truepasswd6 ]]; then
    printf "${RED}Passwords are different! Try again\n\n${NC}"

    sleep 0.5

    confirmPasswd6

  fi

}

function confirmPasswd7 {

  read -s -p "What is the password that you want for ${YEL}Sunday${NC} : " passwd7
  echo ""
  echo ""
  read -s -p "Confirm your password : " truepasswd7
  echo ""
  echo ""
  if [[ $passwd7 != $truepasswd7 ]]; then
    printf "${RED}Passwords are different! Try again\n\n${NC}"

    sleep 0.5

    confirmPasswd7

  fi

}

confirmPasswd1

confirmPasswd2

confirmPasswd3

confirmPasswd4

confirmPasswd5

confirmPasswd6

confirmPasswd7

#salt is randomly generated with the variable pepper
pepper=$(tr -dc A-Za-z0-9 </dev/urandom | head -c 30)
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
Monday1=$(echo "'"${hash1}"'")
Tuesday1=$(echo "'"${hash2}"'")
Wednesday1=$(echo "'"${hash3}"'")
Thursday1=$(echo "'"${hash4}"'")
Friday1=$(echo "'"${hash5}"'")
Saturday1=$(echo "'"${hash6}"'")
Sunday1=$(echo "'"${hash7}"'")

#create secondary bash file for cron
echo "#!/bin/bash

YEL=\$'\e[1;33m' # Yellow
NC=\$'\033[0m' # No Color

whichdate=\$(date "'"+%A, %F, %H:%M"'")
printf "'"\nKPass cron succesfully completed at ${YEL}$whichdate${NC}\n\n"'"

whichday=\$(date "'"+%A"'")

if [[ \$whichday == "'"Monday"'" ]]; then
  usermod -p $Monday1 $User1
elif [[ \$whichday == "'"Tuesday"'" ]]; then
  usermod -p $Tuesday1 $User1
elif [[ \$whichday == "'"Wednesday"'" ]]; then
  usermod -p $Wednesday1 $User1
elif [[ \$whichday == "'"Thursday"'" ]]; then
  usermod -p $Thursday1 $User1
elif [[ \$whichday == "'"Friday"'" ]]; then
  usermod -p $Friday1 $User1
elif [[ \$whichday == "'"Saturday"'" ]]; then
  usermod -p $Saturday1 $User1
elif [[ \$whichday == "'"Sunday"'" ]]; then
  usermod -p $Sunday1 $User1
fi" > Exec$User1-KPass.sh

sudo chmod +x Exec$User1-KPass.sh &> /dev/null

#make the cronjob
sudo chmod +x Exec$User1-KPass.sh &> /dev/null
croncmd="/usr/bin/bash $PWD/$User1/Execroot-KPass.sh > $PWD/root/kpass.log"
cronjob="0 0,12 * * * $croncmd"

( crontab -l &> /dev/null | grep -v -F "$croncmd" ; printf "$cronjob\n\n" ) | crontab -

sudo mkdir $User1 &> /dev/null
sudo mv Exec$User1-KPass.sh $User1 &> /dev/null

#make restrictions
(chmod 700 $PWD && chmod 700 $PWD/$User1 && chmod 700 $PWD/$User1/kpass.log && chmod 700 /etc/cron.d/$User1-kpass && chmod 700 $PWD/$User1/Exec$User1-KPass.sh) &>/dev/null

#execute secondary script to change the password
(/usr/bin/bash $PWD/$User1/Exec$User1-KPass.sh) &> /dev/null

printf "${GRN}We're done!\n${NC}"
echo ""

exit
