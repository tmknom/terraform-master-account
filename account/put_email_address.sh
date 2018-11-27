#!/bin/sh
#
# Put email address for AWS Account to SSM Parameter Store
#
# ./put_email_address.sh operation your-address@example.com

set -eux

ACCOUNT_NAME="${1}"
EMAIL_ADDRESS="${2}"

PARAMETER_PATH="/account/email_address"
aws ssm put-parameter --name "${PARAMETER_PATH}/${ACCOUNT_NAME}" --type "SecureString" --value "${EMAIL_ADDRESS}" --overwrite
