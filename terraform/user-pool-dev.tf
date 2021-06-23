module "user_pool_dev" {
  source = "./modules/user-pool"

  name = local.dev_user_pool_name
}

resource "aws_cognito_identity_provider" "dev-idp1" {
  user_pool_id  = module.user_pool_dev.id
  provider_name = "keycloak-dev"
  # see https://docs.aws.amazon.com/cognito-user-identity-pools/latest/APIReference/API_CreateIdentityProvider.html#CognitoUserPools-CreateIdentityProvider-request-ProviderType
  provider_type = "OIDC"

  provider_details = {
    authorize_scopes              = "openid profile email"
    client_id                     = "testclient"
    attributes_request_method     = "GET"
    oidc_issuer                   = "https://dev.oidc.gov.bc.ca/auth/realms/testrealm"
    attributes_url_add_attributes = "false"
  }

  attribute_mapping = {
    email    = "email"
    username = "sub"
  }
}
