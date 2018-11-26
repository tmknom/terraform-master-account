#!/bin/sh
#
# Create Organizational Unit and Put SSM Parameter
#
# This script is workaround of Organizational Unit creation.
# Because, Terraform does not implement Organizational Unit resources (as of November 2018).
# See: https://github.com/terraform-providers/terraform-provider-aws/pull/4207

set -eux

PARAMETER_PATH="/organization/organizational_unit_id"
PREFIX_ORGANIZATIONAL_UNIT_ID="ou-"

# Check presence of Organizational Unit
CHECK_VALUE=$(aws ssm get-parameter --with-decryption --name "${PARAMETER_PATH}/admin" | jq -r '.Parameter.Value')
if echo "${CHECK_VALUE}" | grep "${PREFIX_ORGANIZATIONAL_UNIT_ID}"; then
  printf "\033[32mCreation of Organizational Unit has already been completed.\033[0m\n"
  exit 0
fi

# Refer Root Id that is used by --parent-id option of create-organizational-unit command
ROOT_ID=$(aws organizations list-roots | jq -r '.Roots[0].Id')

# Create Organizational Unit
ADMIN_ID=$(aws organizations create-organizational-unit --parent-id "${ROOT_ID}" --name admin | jq -r '.OrganizationalUnit.Id')
SERVICE_ID=$(aws organizations create-organizational-unit --parent-id "${ROOT_ID}" --name service | jq -r '.OrganizationalUnit.Id')
SANDBOX_ID=$(aws organizations create-organizational-unit --parent-id "${ROOT_ID}" --name sandbox | jq -r '.OrganizationalUnit.Id')

# Put Organizational Unit Id to SSM Parameter
aws ssm put-parameter --name "${PARAMETER_PATH}/admin" --type "SecureString" --value "${ADMIN_ID}" --overwrite
aws ssm put-parameter --name "${PARAMETER_PATH}/service" --type "SecureString" --value "${SERVICE_ID}" --overwrite
aws ssm put-parameter --name "${PARAMETER_PATH}/sandbox" --type "SecureString" --value "${SANDBOX_ID}" --overwrite
