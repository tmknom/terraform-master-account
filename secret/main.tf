module "admin_organizational_unit_id" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.1.0"
  name   = "${local.path}/admin"
}

module "service_organizational_unit_id" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.1.0"
  name   = "${local.path}/service"
}

module "sandbox_organizational_unit_id" {
  source = "git::https://github.com/tmknom/terraform-aws-ssm-parameter.git?ref=tags/1.1.0"
  name   = "${local.path}/sandbox"
}

locals {
  path = "/organization/organizational_unit"
}
