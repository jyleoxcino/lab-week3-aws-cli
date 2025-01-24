#!/bin/bash



# create key-pair locally named bcitkey with manual passphrase
ssh-keygen -t ed25519 -f $HOME/.ssh/bcitkey -C "bcitkey"

# import the key-pair to aws
aws ec2 import-key-pair --key-name bcitkey --public-key-material fileb://$HOME/.ssh/bcitkey.pub

# verify key-pair using describe
aws ec2 describe-key-pairs --key-name bcitkey

exit 0