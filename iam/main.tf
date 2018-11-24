data "aws_caller_identity" "current" {}

module "iam_account" {
  source        = "git::https://github.com/tmknom/terraform-aws-iam-account.git?ref=tags/1.0.0"
  account_alias = "master-${data.aws_caller_identity.current.account_id}"
}
