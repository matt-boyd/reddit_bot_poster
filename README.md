# Setting up:

First and foremore, it's best to start off by giving the scripts executable permissions. 
For this, I tend to do 
* chmod 775 configuration.sh
* chmod 775 reddit.sh

Next, fill in the credentials.sh file. I've tried to detail these as best as possible, any issues, feel free to contact me. 

Then you just drop these files into the directory of directories of content that you have, and want posted to Reddit. 

The posts file will keep track of the directories that have already been uploaded to reddit. 

The credentials file will create the credentials needed for the bot. These will only last one hour and so if after an hour someone was to find them 
they wouldn't be able to post anything to your account with it. 

In the interest of not spamming Reddit, as this is against the terms of service, make sure to put a delay in the bot, I like to use SystemD to carry this out, and you can find a 
write-up I did for this on http://man.systemd.matthew.software. 
