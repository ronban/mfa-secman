# !/bin/bash

read -p "Please enter the AWS region: " region
read -p "Please enter the account number: " accountnumber

aws --region $region \
lambda invoke --function-name rootmfa_$accountnumber \
$TMPDIR/response.json > $TMPDIR/var.out

tokens=$(cat $TMPDIR/response.json | jq -r '.body')
now_token=$(echo $tokens | jq -r '.now')
next_token=$(echo $tokens | jq -r '.next')

echo Current Token: $now_token
echo Next Token: $next_token

rm -f $TMPDIR/var.out
rm -f $TMPDIR/response.json