# KPass

## *A bash script that changes a user password based on the day of the week automatically configurated by user input that randomly generate the salt of hashes*

### ***Prerequisites:***

**1)** Install 'expect' to be able to use the autoexpect command:

Debian-based OS: 
```bash
sudo apt-get install -y expect
```
RHEL-based OS: 
```bash
sudo yum install -y expect
```
**2)** Being logged in as root (Very Important to access /etc/shadow)

**3)** Assure yourself that the timezone of your server is the good one

That's it!

### ***What's next:***

**1)** Install the KPass.sh file and make it executable.

To install it: 

```bash
wget https://raw.githubusercontent.com/KeepSec-Technologies/KPass/main/KPass.sh
```

To make it executable:
```bash
chmod +x KPass.sh
```
**2)** Then run: 
```bash
autoexpect -quiet $PWD/KPass.sh
```
***(Very important to use this exact command)***

**3)** Answer the questions like the image below

![image](https://user-images.githubusercontent.com/108779415/177899289-40cfa492-59d2-4fd5-9fd1-b837a9db0627.png)



**Warning: Do not change the path of the 'script.exp' file since the cronjob depends on it.**

The path to the directory with everything in it is **/root/.kpass**

*And we're done!*

If you messed up your input don't worry just rerun the script with autoexpect, it will overwrite everything.

Feel free to modify the code if there's something that you want to change.
