# !/bin/bash

read -p "Please enter the AWS region: " region
read -p "Please enter the account number: " accountnumber
read -s -p "Please enter the new MFA Token: " token

echo "{ \"root_mfa_token\": \"$token\"}" > $TMPDIR/mfa_token.json

aws --region $region secretsmanager \
update-secret --secret-id rootmfa_$accountnumber \
--secret-string file://$TMPDIR/mfa_token.json

rm -f $TMPDIR/mfa_token.json