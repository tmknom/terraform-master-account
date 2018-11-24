data "aws_caller_identity" "current" {}

resource "aws_iam_user" "admin" {
  name = "Admin"

  path          = "/login/"
  force_destroy = true
}

module "admin_iam_group" {
  source = "git::https://github.com/tmknom/terraform-aws-iam-group.git?ref=tags/1.0.0"
  name   = "Admin"
  policy = "${data.aws_iam_policy_document.admin_iam_policy_document.json}"

  users = [
    "${aws_iam_user.admin.name}",
  ]

  path        = "/login/"
  description = "Login administrators"
}

data "aws_iam_policy_document" "admin_iam_policy_document" {
  statement {
    effect    = "Allow"
    actions   = ["*"]
    resources = ["*"]
  }
}

module "iam_account" {
  source        = "git::https://github.com/tmknom/terraform-aws-iam-account.git?ref=tags/1.0.0"
  account_alias = "master-${data.aws_caller_identity.current.account_id}"
}
