output "admin_iam_user_arn" {
  value = "${aws_iam_user.admin.arn}"
}

output "admin_iam_user_name" {
  value = "${aws_iam_user.admin.name}"
}

output "admin_iam_user_unique_id" {
  value = "${aws_iam_user.admin.unique_id}"
}

output "admin_iam_group_name" {
  value = "${module.admin_iam_group.iam_group_name}"
}

output "admin_iam_group_id" {
  value = "${module.admin_iam_group.iam_group_id}"
}

output "admin_iam_group_arn" {
  value = "${module.admin_iam_group.iam_group_arn}"
}

output "admin_iam_group_path" {
  value = "${module.admin_iam_group.iam_group_path}"
}

output "admin_iam_group_unique_id" {
  value = "${module.admin_iam_group.iam_group_unique_id}"
}

output "admin_iam_group_membership_name" {
  value = "${module.admin_iam_group.iam_group_membership_name}"
}

output "admin_iam_policy_id" {
  value = "${module.admin_iam_group.iam_policy_id}"
}

output "admin_iam_policy_arn" {
  value = "${module.admin_iam_group.iam_policy_arn}"
}

output "admin_iam_policy_description" {
  value = "${module.admin_iam_group.iam_policy_description}"
}

output "admin_iam_policy_name" {
  value = "${module.admin_iam_group.iam_policy_name}"
}

output "admin_iam_policy_path" {
  value = "${module.admin_iam_group.iam_policy_path}"
}

output "admin_iam_policy_document" {
  value = "${module.admin_iam_group.iam_policy_document}"
}

output "iam_account_password_policy_expire_passwords" {
  value = "${module.iam_account.iam_account_password_policy_expire_passwords}"
}
