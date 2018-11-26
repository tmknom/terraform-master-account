# Organizational Unit Ids
module "admin_organizational_unit_id" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.1.0"
  name   = "${local.path}/admin"
  value  = "${local.uninitialized_rganizational_unit_id}"
}

module "service_organizational_unit_id" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.1.0"
  name   = "${local.path}/service"
  value  = "${local.uninitialized_rganizational_unit_id}"
}

module "sandbox_organizational_unit_id" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.1.0"
  name   = "${local.path}/sandbox"
  value  = "${local.uninitialized_rganizational_unit_id}"
}

module "uninitialized_organizational_unit_id" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.1.0"
  name   = "${local.path}/uninitialized"
  value  = "${local.uninitialized_rganizational_unit_id}"
  type   = "String"
}

locals {
  path = "/organization/organizational_unit_id"

  # If Organizational Unit was not created, this value is set.
  uninitialized_rganizational_unit_id = "UNINITIALIZED"
}

# AWS Account email addresses
module "operation_email_address" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.1.0"
  name   = "${local.email_address_path}/operation"
  value  = "${local.uninitialized_email_address}"
}

module "uninitialized_email_address" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.1.0"
  name   = "${local.email_address_path}/uninitialized"
  value  = "${local.uninitialized_email_address}"
  type   = "String"
}

locals {
  email_address_path = "/account/email_address"

  # If email address for AWS Account was not stored, this value is set.
  #
  # NOTE: This value must be a valid email address.
  #       That's because aws_organizations_account resouce assumed to refer to unvalid email address
  #       will cause error even when terraform plan.
  uninitialized_email_address = "uninitialized@example.com"
}
