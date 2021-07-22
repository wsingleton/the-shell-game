#!/bin/bash

newUsername=$1
pemFile=./keys/the-shell-game.pem
connectionStr=$2

generateKeyPair="aws ec2 create-key-pair --key-name $newUsername --query 'KeyMaterial' --output text >> ~/keys/$newUsername.pem"
setKeyPermissions="sudo chmod 600 ~/keys/$newUsername.pem"
createUser="sudo adduser $newUsername; sudo usermod -a -G players $newUsername"
createSshDir="sudo mkdir /home/$newUsername/.ssh; sudo touch /home/$newUsername/.ssh/authorized_keys"
chmodSshDir="sudo chmod 700 /home/$newUsername/.ssh; sudo chmod 600 .ssh/authorized_keys"
chownSshDir="sudo chown $newUsername /home/$newUsername/.ssh; sudo chown $newUsername /home/$newUsername/.ssh/authorized_keys"
chgrpSshDir="sudo chgrp $newUsername /home/$newUsername/.ssh; sudo chgrp $newUsername /home/$newUsername/.ssh/authorized_keys"
configureSshDir="$createSshDir; $chmodSshDir; $chownSshDir; $chgrpSshDir"
storeKey="sudo ssh-keygen -y -f /home/ec2-user/keys/$newUsername.pem | sudo tee -a /home/$newUsername/.ssh/authorized_keys"
configureBashRc="sudo cp ~/preconfigured.bashrc /home/$newUsername/.bashrc"
setupTsgDir="sudo mkdir /home/$newUsername/.tsg; sudo cp -R ~/the-shell-game.tar.gz /home/$newUsername/.tsg/the-shell-game.tar.gz; sudo cp ~/reset.sh /home/$newUsername/.tsg/reset.sh"
setupGame="sudo tar -xzf /home/$newUsername/.tsg/the-shell-game.tar.gz -C /home/$newUsername; sudo chown -R $newUsername /home/$newUsername/the-shell-game"
createEndPortal="sudo ln -s /home/$newUsername /home/$newUsername/the-shell-game/room0/room1/room2/room3/room4/room5/room6/room7/room8/room9/room10/portal"
echo "$generateKeyPair; $setKeyPermissions; $createUser; $configureSshDir; $storeKey; $configureBashRc; $setupTsgDir; $setupGame; $createEndPortal; exit" | ssh -tt -i $pemFile $connectionStr

# Once disconnected, download the generated pem file to the trainer's local machine so it can be given to the associate.
# Future implementations should deposit this file into an S3 bucket that can trigger a Lambda that will send the file to the associate via email.
scp -i $pemFile "$connectionStr:~/keys/$newUsername.pem" "./keys/$newUsername.pem"

