# The Shell Game

The Shell Game (TSG) is an interactive shell-based game that aims to get users more comfortable with the command line. This repository is for trainers that wish to set up the activity for their associates, it includes all the necessary files for getting started.

## Prerequisites

Players should be aware of simple Unix concepts (i.e. directory structures, relative paths) and commands (i.e. `cd`, `ls`, `pwd`, and `cat`). Knowledge of `ssh` is preferred but not necessary required since the connection command can be provided the player.


## Setting up

You should create a IAM user that has programmatic access to AWS (through the CLI). Make note of the Access Key and Secret Access Key provided to you when the user is created, you will need to these to configure the AWS CLI within the EC2 instance. You should attach the following custom policy to your newly created user:

`tsg-policy`:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "createDeleteKeyPairs",
            "Effect": "Allow",
            "Action": [
                "ec2:CreateKeyPair",
                "ec2:DeleteKeyPair"
            ],
            "Resource": [
                "arn:aws:ec2:*:<AWS Account ID>:key-pair/*"
            ]
        },
        {
            "Sid": "getObjects",
            "Effect": "Allow",
            "Action": [
                "s3:ListBucket",
                "s3:GetObject"
            ],
            "Resource": [
                "arn:aws:s3:::the-shell-game",
                "arn:aws:s3:::the-shell-game/*"
            ]
        }
    ]
}
```

Be sure to put your own AWS account number where the placeholder is in the policy JSON!

Once complete, allocate an AWS EC2 t2.micro instance and store the provided pem file in a safe place. Connect using `ssh` to the instance and configure the AWS CLI using the `aws configure` command, use the access keys obtained from earlier. This will allow you to run key generation/deletion commands from your EC2 instance.

Run the `tsg-setup.sh` script, providing you private key file and the instance connection string (e.g. `ec2-user@<EC2-IP>`). This script will use `ssh` to connect to your EC2 instance and copy a tarball from the hosted TSG S3 bucket. This tarball will be unpacked, leaving the following items in the home directory of your EC2 instance:


- `keys/`: Directory used for storing keys of generated users
- `preconfigured.bashrc`: Will become the `.bashrc` used in TSG; wraps up several common commands to provide a text-based adventure feel, as well as preventing the player from running certain commands
- `reset.sh`: Used to reset the progress of a current instance of TSG (if players use `sudo` it will trigger a reset of all their progress)
- `set-user-nproc-limit.sh`: Used to edit the `/etc/security/limit.conf` file and puts a cap on the number of processes that are allowed by player accounts
- `the-shell-game.tar.gz`: Holds the packaged game that will deployed to a player's home directory when they are created using the `create-user.sh` script
- `tsg-setup.tar.gz` (if not removed after unpacking, optional to keep)


Additionally, the `tsg-setup.sh` will create a user group named `players` and then edit your instance's `/etc/security/limits.conf` file setting a max on the number of processes (10) that can be ran by users in the `players` group. This is used to prevent accidental forkbombs.

---

Once you have let the setup script run to completion. You will be ready to create new players using the `create-user.sh` script, providing to it three arguments: the new user's username, your private key file, and the instance connection string. This script will create the user, set up the game for them, and replace their default `bash.rc` with the `preconfigured.bashrc` file that was obtained during setup. 


The script will also generate a private key and download it to the `local-files/keys` directory. You can share this key file, the username, and the player's instance connection string (e.g. `<player-username>@<EC2-IP>` with the player through whatever medium you choose. A template is provided in the `initial-instructions.txt` file that can be used to help you disseminate the needed information to players.

When a player is finished and no longer require access to the instance, you may delete their user and private key pair using the `delete-user.sh` script.
