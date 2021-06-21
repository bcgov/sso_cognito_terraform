# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool
# Note that it does not support device, sms, mfa and email related arguments.
resource "aws_cognito_user_pool" "this" {
  name = var.name

  account_recovery_setting {
    recovery_mechanism {
      name     = var.priority_recovery_mechanism
      priority = 1
    }
  }

  admin_create_user_config {
    allow_admin_create_user_only = var.allow_admin_create_user_only
  }

  alias_attributes = var.alias_attributes

  auto_verified_attributes = var.auto_verified_attributes

  mfa_configuration = var.mfa_configuration

  password_policy {
    minimum_length                   = var.password_policy_minimum_length
    require_lowercase                = var.password_policy_require_lowercase
    require_numbers                  = var.password_policy_require_numbers
    require_symbols                  = var.password_policy_require_symbols
    require_uppercase                = var.password_policy_require_uppercase
    temporary_password_validity_days = var.password_policy_temporary_password_validity_days
  }

  tags = {
    "created-by" : "Terraform"
  }
}

resource "aws_cognito_user_pool_domain" "this" {
  domain       = var.name
  user_pool_id = aws_cognito_user_pool.this.id
}
