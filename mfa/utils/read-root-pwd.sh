# !/bin/bash

read -p "Please enter the AWS region: " region
read -p "Please enter the account number: " accountnumber

echo "{ \"root_password_\": \"$password\"}" > $TMPDIR/root_password.json

aws --region $region secretsmanager \
get-secret-value --secret-id rootpwd_$accountnumber \
| jq -r 'SecretString'

rm -f $TMPDIR/root_password.json