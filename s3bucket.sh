#This shell script provisions 2 s3 buckets 
#Also creates a file in each s3 bucket
#List buckets for validation and deletes resources after

#!/bin/bash

#Create variables
PROVISION1="daxpobucket1"
PROVISION2="daxpobucket2"

#Notify bucket creation
echo "Create 2 s3 buckets"

#Provision s3 "daxpobucket1"
aws s3 mb s3://$PROVISION1

#Validate s3 "daxpobucket1" creation
echo -e "AWS s3 bucket daxpobucket1 \vhas been \vcreated!"

#Provision s3 "daxpobucket2"
aws s3 mb s3://$PROVISION2

#Validate s3 "daxpobucket2" creation
echo -e "AWS s3 bucket daxpobucket2 \vhas been \vcreated!"

#Wait 4 seconds 
sleep 4

#Notify file creation
echo "Create files and move to s3 buckets"

#Create .txt file for "daxpobucket1"
touch file1.txt


#Move file to "daxpobucket1"
aws s3 mv "file1.txt" s3://daxpobucket1

#Create .txt file for "daxpobucket2"
touch file2.txt


#Move file to "daxpobucket2"
aws s3 mv "file2.txt" s3://daxpobucket2

#Wait 4 seconds 
sleep 4

#List resources
echo "List Resources"

#List buckets
aws s3 ls 
aws s3 ls daxpobucket1
aws s3 ls daxpobucket2

#Delete resources
echo "Delete resources"

aws s3 rm s3://daxpobucket1 --recursive
aws s3 rm s3://daxpobucket2 --recursive

#Validate files deleted
aws s3 ls daxpobucket1
aws s3 ls daxpobucket2

aws s3 rb s3://daxpobucket1
aws s3 rb s3://daxpobucket2

#Validate buckets deleted
aws s3 ls










