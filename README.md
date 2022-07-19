# KPass

## *A bash script that changes a user password based on the day of the week automatically configurated by user input that randomly generate the salt of hashes*

### ***Prerequisites:***

**1)** Being logged in as root (Very Important to access /etc/shadow)

**2)** Assure yourself that the timezone of your server is the good one

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
**2)** Then run it: 
```bash
./KPass.sh
```

**3)** Answer the questions like the image below

![image](https://user-images.githubusercontent.com/108779415/179622354-ea57f2b9-b33f-45c3-9a8d-1208a8e92d03.png)



**Warning: Do not change the path of the files in the '.kpass' directory since the cronjob depends on it.**

The path to the directory with everything in it is **$PWD/.kpass** and the cronjob log is in **$PWD/.kpass/[YOUR USER]/kpass.log** 

Note: the cronjob runs twice a day just to make sure the password changed (just in case)

*And we're done!*

If you messed up your input don't worry just re-run the script, it will overwrite everything.

Feel free to modify the code if there's something that you want to change.
