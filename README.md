# The Shell Game

The Shell Game (TSG) is an interactive shell-based game that aims to get users more comfortable with the command line. This repository is for trainers that wish to set up the activity for their associates, it includes all the necessary files for getting started.

## Prerequisites

Players should be aware of simple Unix concepts (i.e. directory structures, relative paths) and commands (i.e. `cd`, `ls`, `pwd`, and `cat`). Knowledge of `ssh` is preferred but not necessary required since the connection command can be provided the player.


## Setting up

You should create a IAM user that has programmatic access to AWS (through the CLI). Make note of the Access Key and Secret Access Key provided to you when the user is created, you will need to these to configure the AWS CLI within the EC2 instance. You should attach the following custom policies to your newly created user:

`create-key-pair-policy`:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "ec2:CreateKeyPair",
            "Resource": "arn:aws:ec2:*:011217676466:key-pair/*"
        }
    ]
}
```

`delete-key-pair-policy`:
```
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "VisualEditor0",
            "Effect": "Allow",
            "Action": "ec2:DeleteKeyPair",
            "Resource": "arn:aws:ec2:*:011217676466:key-pair/*"
        }
    ]
}
```


Once complete, allocate an AWS EC2 t2.micro instance and store the provided pem file in a safe place. Connect using `ssh` to the instance and configure the AWS CLI using the `aws configure` command, use the access keys obtained from earlier. This will allow you to run key generation/deletion commands from your EC2 instance.

Then, use `scp` to move the `tsg-setup.tar.gz` file from your local machine to the EC2 instance using the `ec2-user` pem file provided to you during instance creation. Connect once more using `ssh` to the instance and unpack the tarball into the home directory. Once the tarball is unpacked you should have the following items in the home directory of your EC2 instance:

- `set-user-nproc-limit.sh`: Used to edit the `/etc/security/limit.conf` file and puts a cap on the number of processes that are allowed by player accounts
- `preconfigured.bashrc`: Will become the `.bashrc` used in TSG; wraps up several common commands to provide a text-based adventure feel, as well as preventing the player from running certain commands
- `reset.sh`: Used to reset the progress of a current instance of TSG (if players use `sudo` it will trigger a reset of all their progress)
- `the-shell-game.tar.gz`: The primary tarball that contains TSG, it is used when running the `create-user.sh` script; you do not need to unpack this file yourself
- `tsg-setup.tar.gz` (if not removed after unpacking, optional to keep)
- `keys/`: Directory used for storing keys of generated users

