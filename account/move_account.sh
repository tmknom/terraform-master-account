#!/bin/sh
#
# Moves an account from its current source parent to the specified destination parent.
#
# ./move_account.sh operation admin

ACCOUNT_NAME="${1}"
DESTINATION_OU_NAME="${2}"

ROOT_ID=$(aws organizations list-roots | jq -r ".Roots[0].Id")
OU_LIST=$(aws organizations list-organizational-units-for-parent --parent-id "${ROOT_ID}")
ACCOUNT_LIST=$(aws organizations list-accounts)

DESTINATION_OU_ID=$(echo "${OU_LIST}" | jq -r ".OrganizationalUnits[] | select(.Name | test('${DESTINATION_OU_NAME}')) | .Id")
ACCOUNT_ID=$(echo "${ACCOUNT_LIST}" | jq -r ".Accounts[] | select( .Name | test('${ACCOUNT_NAME}')) | .Id")
CURRENT_PARENT_ID=$(aws organizations list-parents --child-id "${ACCOUNT_ID}" | jq -r ".Parents[0].Id")

aws organizations move-account \
  --ACCOUNT_LIST-id "${ACCOUNT_ID}" \
  --source-parent-id "${CURRENT_PARENT_ID}" \
  --destination-parent-id "${DESTINATION_OU_ID}"
