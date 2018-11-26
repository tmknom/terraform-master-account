resource "aws_organizations_organization" "default" {
  feature_set = "ALL"
}

# Service control policy
#
# NOTE: Create Organizational Units by AWS Management Console or AWS CLI in advance.
#       Because, Terraform does not implement Organizational Unit resources (as of November 2018).
#       See: https://github.com/terraform-providers/terraform-provider-aws/pull/4207
module "admin_organizations_policy" {
  source    = "git::https://github.com/tmknom/terraform-aws-organizations-policy.git?ref=tags/1.0.0"
  name      = "admin"
  target_id = "${local.admin_organizational_unit_id}"

  deny_actions = [
    "cloudtrail:StopLogging",
  ]

  enabled = "${local.enabled_admin_organizational_unit}"
}

module "service_organizations_policy" {
  source    = "git::https://github.com/tmknom/terraform-aws-organizations-policy.git?ref=tags/1.0.0"
  name      = "service"
  target_id = "${local.service_organizational_unit_id}"

  deny_actions = [
    "cloudtrail:StopLogging",
  ]

  enabled = "${local.enabled_service_organizational_unit}"
}

module "sandbox_organizations_policy" {
  source    = "git::https://github.com/tmknom/terraform-aws-organizations-policy.git?ref=tags/1.0.0"
  name      = "sandbox"
  target_id = "${local.sandbox_organizational_unit_id}"

  deny_actions = [
    "cloudtrail:StopLogging",
  ]

  enabled = "${local.enabled_sandbox_organizational_unit}"
}

data "aws_ssm_parameter" "admin_organizational_unit_id" {
  name = "${local.path}/admin"
}

data "aws_ssm_parameter" "service_organizational_unit_id" {
  name = "${local.path}/service"
}

data "aws_ssm_parameter" "sandbox_organizational_unit_id" {
  name = "${local.path}/sandbox"
}

data "aws_ssm_parameter" "uninitialized_organizational_unit_id" {
  name = "${local.path}/uninitialized"
}

locals {
  path = "/organization/organizational_unit_id"

  admin_organizational_unit_id   = "${data.aws_ssm_parameter.admin_organizational_unit_id.value}"
  service_organizational_unit_id = "${data.aws_ssm_parameter.service_organizational_unit_id.value}"
  sandbox_organizational_unit_id = "${data.aws_ssm_parameter.sandbox_organizational_unit_id.value}"

  # The following code is workaround.
  #
  # This workaround works as the Organizations Policy resource will create, if Organizational Unit was created.
  # Because, Terraform does not implement Organizational Unit resources (as of November 2018).
  # See: https://github.com/terraform-providers/terraform-provider-aws/pull/4207

  uninitialized                       = "${data.aws_ssm_parameter.uninitialized_organizational_unit_id.value}"
  enabled_admin_organizational_unit   = "${local.admin_organizational_unit_id == local.uninitialized ? false : true}"
  enabled_service_organizational_unit = "${local.service_organizational_unit_id == local.uninitialized ? false : true}"
  enabled_sandbox_organizational_unit = "${local.sandbox_organizational_unit_id == local.uninitialized ? false : true}"
}
