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
