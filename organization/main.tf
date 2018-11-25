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
  target_id = "${data.aws_ssm_parameter.admin_organizational_unit_id.value}"

  deny_actions = [
    "cloudtrail:StopLogging",
  ]
}

module "service_organizations_policy" {
  source    = "git::https://github.com/tmknom/terraform-aws-organizations-policy.git?ref=tags/1.0.0"
  name      = "service"
  target_id = "${data.aws_ssm_parameter.service_organizational_unit_id.value}"

  deny_actions = [
    "cloudtrail:StopLogging",
  ]
}

module "sandbox_organizations_policy" {
  source    = "git::https://github.com/tmknom/terraform-aws-organizations-policy.git?ref=tags/1.0.0"
  name      = "sandbox"
  target_id = "${data.aws_ssm_parameter.sandbox_organizational_unit_id.value}"

  deny_actions = [
    "cloudtrail:StopLogging",
  ]
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

locals {
  path = "/organization/organizational_unit"
}
