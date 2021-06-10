resource "aws_cognito_user_pool" "first" {
  name = "dev-user-pool"
}

resource "aws_cognito_user_pool_domain" "this" {
  domain       = "bcgov-poc-dev"
  user_pool_id = aws_cognito_user_pool.first.id
}


resource "aws_cognito_identity_provider" "idp1" {
  user_pool_id  = aws_cognito_user_pool.first.id
  provider_name = "keycloak-test"
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

resource "aws_cognito_user_pool_client" "client1" {
  name = "client1"

  user_pool_id = aws_cognito_user_pool.first.id

  generate_secret = true

  supported_identity_providers = ["keycloak-test"]

  callback_urls = ["http://localhost:3000/oauth/cognito"]
  logout_urls   = []

  allowed_oauth_flows_user_pool_client = true
  allowed_oauth_flows                  = ["code"]
  allowed_oauth_scopes                 = ["openid", "email", "profile"]
  explicit_auth_flows                  = ["ALLOW_CUSTOM_AUTH", "ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
}
