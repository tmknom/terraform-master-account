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
