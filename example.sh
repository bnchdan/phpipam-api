#!/bin/bash
#https://phpipam.net/api/api_documentation/

link='127.0.0.1'
user='user'
pass='password'
#Go to settings in phpipam GUI and enable API module, than go to settings > API and create new API App( App security - SSL with User token )
app_id="test" 

# Login & Create Session
token=$(curl -X POST -s -k --user ${user}:${pass} 'https://'$link'/api/'$app_id'/user/' -i)

#get token
token=$(echo $token | awk -F '":{"' '{print $2}' | awk -F '":"' '{print $2}' | awk -F '","' '{print $1}')

echo "token:"
echo $token



#create a new subnet
subnet='12.0.0.0'
mask='24'
section_id='18'
out=$(curl -X POST -s -k 'https://'$link'/api/'$app_id'/subnets/?subnet='$subnet'&mask='$mask'&sectionId='$section_id  --header "token: $token" )

echo $out 
