#!/bin/bash

userToDelete=$1
pemFile=$2
connectionStr=$3

deleteKeyPair="aws ec2 delete-key-pair --key-name $userToDelete"
removeStoredKey="sudo rm ~/keys/$userToDelete.pem"
deleteUser="sudo userdel -r $userToDelete"
echo "$deleteKeyPair; $removeStoredKey; $deleteUser; exit" | ssh -tt -i $pemFile $connectionStr
rm ./keys/$userToDelete.pem

