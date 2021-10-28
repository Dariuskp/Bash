#This shell script creates 2 iam users and 2 groups
#Adds users to groups

#!/bin/bash

#Create variables 
GROUP1="CloudEngineers"
GROUP2="SytemEngineers"
USER1="DariusP"
USER2="DioneP"

#Notify creation of groups
echo Create 2 IAM Groups

aws iam create-group --group-name $GROUP1
aws iam create-group --group-name $GROUP2

#Notify that groups have been created 
echo Groups have been ceated

#Wait 3 seconds 
sleep 3 

#Notfiy creation of users
echo Create 2 IAM Users

aws iam create-user --user-name $USER1
aws iam create-user --user-name $USER2

#Noify that users have been created
echo Users have been ceated

#Notify adding users to groups
echo Add user to group

aws iam add-user-to-group --user-name $USER1 --group-name $GROUP1
aws iam add-user-to-group --user-name $USER2 --group-name $GROUP2

#Validate users are in groups
echo Users added to group

aws iam get-group --group-name $GROUP1
aws iam get-group --group-name $GROUP2



