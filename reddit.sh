#!/bin/bash
source configuration.sh
test=`ls -d */ | sed 's#/##'`
for d in $test ; do
    if grep -Fxq "$d" posts.txt
	then
	   continue 
	else
		   echo "$d" >> posts.txt
		   website=$website_name
		   # This one is option, if you don't want a domain like test.directory_name.domainname.com, delete all references to $subdomain in here.
		   # By keeping $d, this will name a new subdomain like: directory_name.domainname.com
		   subdomain=$website_subdomain
		   domain=$subdomain$d$website
		   echo $domain
		   curl -X POST -d "grant_type=password&username=$bot_username&password=$bot_password" --user "$bot_authentication" https://www.reddit.com/api/v1/access_token  --user-agent "$bot_name" > credentials
		   sed -i 's/,.*$//' credentials
		   sed -i 's/{"access_token": "//' credentials
		   sed -i 's/.$//' credentials
		   token=$(<credentials)
		   curl -H "Authorization: bearer $token" -A "$bot_name" https://oauth.reddit.com/api/submit -d "api_type=json&extension=json&sendreplies=true&resubmit=true&kind=link&sr=$bot_subreddit&title=$d&url=http://$domain"
		   break
     fi
done
