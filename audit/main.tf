data "aws_caller_identity" "current" {}

module "s3_access_log" {
  source = "git::https://github.com/tmknom/terraform-aws-s3-access-log.git?ref=tags/1.0.0"
  name   = "s3-access-log-${data.aws_caller_identity.current.account_id}"

  force_destroy = true
}

module "s3_cloudtrail" {
  source                = "git::https://github.com/tmknom/terraform-aws-s3-cloudtrail.git?ref=tags/1.0.0"
  name                  = "cloudtrail-${data.aws_caller_identity.current.account_id}"
  logging_target_bucket = "${module.s3_access_log.s3_bucket_id}"

  force_destroy = true
}
