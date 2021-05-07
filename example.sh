#!/bin/bash
#https://phpipam.net/api/api_documentation/

link='127.0.0.1'
user='user'
pass='password'
#Go to settings in phpipam GUI and enable API module, than go to settings > API and create new API App.
app_id="test" 

# Login & Create Session
token=$(curl -X POST -s -k --user ${user}:${pass} 'https://'$link'/api/'$app_id'/user/' -i)

#get token
token=$(echo $token | awk -F '":{"' '{print $2}' | awk -F '":"' '{print $2}' | awk -F '","' '{print $1}')

echo "token:"
echo $token

# out=$(curl -X GET -s -k --user Admin:admin123 https://192.168.110.45/phpipam/api/test/addresses --header "token: $token")

#create a new subnet
subnet='12.0.0.0'
mask='24'
out=$(curl -X POST -s -k 'https://'$link'/api/'$app_id'/subnets/?subnet='$subnet'&mask='$mask'&sectionId=18'  --header "token: $token" )

echo $out 