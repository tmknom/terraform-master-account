# https://github.com/tmknom/template-terraform-module
TERRAFORM_VERSION := 0.11.10
-include .Makefile.terraform

.Makefile.terraform:
	curl -sSL https://raw.githubusercontent.com/tmknom/template-terraform-aws-account/master/Makefile.terraform -o .Makefile.terraform

# Constant definitions
ACCOUNT_DIR := ./account
AUDIT_DIR := ./audit
IAM_DIR := ./iam
MONITORING_DIR := ./monitoring
ORGANIZATION_DIR := ./organization
SECRET_DIR := ./secret


# account
terraform-plan-account: ## Run terraform plan account
	$(call terraform,${ACCOUNT_DIR},init)
	$(call terraform,${ACCOUNT_DIR},plan) | tee -a /dev/stderr | docker run --rm -i tmknom/terraform-landscape

terraform-apply-account: ## Run terraform apply account
	$(call terraform,${ACCOUNT_DIR},apply)

terraform-destroy-account: ## Run terraform destroy account
	$(call terraform,${ACCOUNT_DIR},destroy)


# audit
terraform-plan-audit: ## Run terraform plan audit
	$(call terraform,${AUDIT_DIR},init)
	$(call terraform,${AUDIT_DIR},plan) | tee -a /dev/stderr | docker run --rm -i tmknom/terraform-landscape

terraform-apply-audit: ## Run terraform apply audit
	$(call terraform,${AUDIT_DIR},apply)

terraform-destroy-audit: ## Run terraform destroy audit
	$(call terraform,${AUDIT_DIR},destroy)


# iam
terraform-plan-iam: ## Run terraform plan iam
	$(call terraform,${IAM_DIR},init)
	$(call terraform,${IAM_DIR},plan) | tee -a /dev/stderr | docker run --rm -i tmknom/terraform-landscape

terraform-apply-iam: ## Run terraform apply iam
	$(call terraform,${IAM_DIR},apply)

terraform-destroy-iam: ## Run terraform destroy iam
	$(call terraform,${IAM_DIR},destroy)


# monitoring
terraform-plan-monitoring: ## Run terraform plan monitoring
	$(call terraform,${MONITORING_DIR},init)
	$(call terraform,${MONITORING_DIR},plan) | tee -a /dev/stderr | docker run --rm -i tmknom/terraform-landscape

terraform-apply-monitoring: ## Run terraform apply monitoring
	$(call terraform,${MONITORING_DIR},apply)

terraform-destroy-monitoring: ## Run terraform destroy monitoring
	$(call terraform,${MONITORING_DIR},destroy)


# organization
terraform-plan-organization: ## Run terraform plan organization
	$(call terraform,${ORGANIZATION_DIR},init)
	$(call terraform,${ORGANIZATION_DIR},plan) | tee -a /dev/stderr | docker run --rm -i tmknom/terraform-landscape

terraform-apply-organization: ## Run terraform apply organization
	$(call terraform,${ORGANIZATION_DIR},apply)

terraform-destroy-organization: ## Run terraform destroy organization
	$(call terraform,${ORGANIZATION_DIR},destroy)


# secret
terraform-plan-secret: ## Run terraform plan secret
	$(call terraform,${SECRET_DIR},init)
	$(call terraform,${SECRET_DIR},plan) | tee -a /dev/stderr | docker run --rm -i tmknom/terraform-landscape

terraform-apply-secret: ## Run terraform apply secret
	$(call terraform,${SECRET_DIR},apply)

terraform-destroy-secret: ## Run terraform destroy secret
	$(call terraform,${SECRET_DIR},destroy)
