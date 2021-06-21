# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client
resource "aws_cognito_user_pool_client" "this" {
  name = var.name

  user_pool_id = var.user_pool_id

  generate_secret = var.generate_secret

  supported_identity_providers = var.supported_identity_providers

  callback_urls = var.callback_urls
  logout_urls   = var.logout_urls

  allowed_oauth_flows_user_pool_client = var.allowed_oauth_flows_user_pool_client
  allowed_oauth_flows                  = var.allowed_oauth_flows
  allowed_oauth_scopes                 = var.allowed_oauth_scopes
  explicit_auth_flows                  = var.explicit_auth_flows

  id_token_validity      = var.id_token_validity
  access_token_validity  = var.access_token_validity
  refresh_token_validity = var.refresh_token_validity

  token_validity_units {
    id_token      = var.token_validity_unit_id_token
    access_token  = var.token_validity_unit_access_token
    refresh_token = var.token_validity_unit_refresh_token
  }

  prevent_user_existence_errors = var.prevent_user_existence_errors
  read_attributes               = var.read_attributes
  write_attributes              = var.write_attributes
}
