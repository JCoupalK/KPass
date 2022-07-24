# KPass

## *A bash script that changes a user password based on the day of the week automatically configurated by user input that randomly generate the salt of hashes*

### ***Prerequisites:***

**1)** Being logged in as root (Very Important to access /etc/shadow)

**2)** Assure yourself that the timezone of your server is the good one:
```bash
timedatectl list-timezones
timedatectl set-timezone <your_time_zone>
```

That's it!

### ***What's next:***

**1)** Install the KPass.sh file:
```bash
wget https://raw.githubusercontent.com/KeepSec-Technologies/KPass/main/KPass.sh
```

**3)** Make it executable:
```bash
chmod +x KPass.sh
```
**3)** Then run it: 
```bash
./KPass.sh
```

**3)** Answer the questions like the image below:

![image](https://user-images.githubusercontent.com/108779415/180656391-b31f214b-b38e-48ca-9834-69c9542284f1.png)



**Warning: Do not change the path of the files in the '.kpass' directory since the cronjob depends on it.**

The path to the directory with everything in it is **$PWD/.kpass** and the cronjob log is in **$PWD/.kpass/[YOUR USER]/kpass.log** 

Note: the cronjob runs twice a day (12AM and 12PM) just to make sure the password changed (just in case)

*And we're done!*

If you messed up your input don't worry just re-run the script, it will overwrite everything.


If you want to uninstall it do:
```bash
rm -rf [YOUR DIRECTORY]/.kpass
```
then: 
```bash
rm -f /etc/cron.d/kpass
```

Feel free to modify the code if there's something that you want to change.
