output "organizations_organization_arn" {
  value = "${aws_organizations_organization.default.arn}"
}

output "organizations_organization_id" {
  value = "${aws_organizations_organization.default.id}"
}

output "organizations_organization_master_account_arn" {
  value = "${aws_organizations_organization.default.master_account_arn}"
}

output "organizations_organization_master_account_email" {
  value = "${aws_organizations_organization.default.master_account_email}"
}

output "organizations_organization_master_account_id" {
  value = "${aws_organizations_organization.default.master_account_id}"
}

output "admin_organizational_unit_id" {
  value = "${data.aws_ssm_parameter.admin_organizational_unit_id.value}"
}

output "service_organizational_unit_id" {
  value = "${data.aws_ssm_parameter.service_organizational_unit_id.value}"
}

output "sandbox_organizational_unit_id" {
  value = "${data.aws_ssm_parameter.sandbox_organizational_unit_id.value}"
}

output "admin_organizations_policy_id" {
  value = "${module.admin_organizations_policy.organizations_policy_id}"
}

output "admin_organizations_policy_arn" {
  value = "${module.admin_organizations_policy.organizations_policy_arn}"
}

output "service_organizations_policy_id" {
  value = "${module.service_organizations_policy.organizations_policy_id}"
}

output "service_organizations_policy_arn" {
  value = "${module.service_organizations_policy.organizations_policy_arn}"
}

output "sandbox_organizations_policy_id" {
  value = "${module.sandbox_organizations_policy.organizations_policy_id}"
}

output "sandbox_organizations_policy_arn" {
  value = "${module.sandbox_organizations_policy.organizations_policy_arn}"
}
