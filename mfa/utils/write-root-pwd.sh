# !/bin/bash

read -p "Please enter the AWS region: " region
read -p "Please enter the account number: " accountnumber
read -s -p "Please enter the new Root Password: " password

echo "{ \"root_password_\": \"$password\"}" > $TMPDIR/root_password.json

aws --region $region secretsmanager \
update-secret --secret-id rootpwd_$accountnumber \
--secret-string file://$TMPDIR/root_password.json

rm -f $TMPDIR/root_password.json