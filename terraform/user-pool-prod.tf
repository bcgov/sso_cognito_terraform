resource "aws_cognito_user_pool" "prod" {
  name = local.prod_user_pool_name
}

resource "aws_cognito_user_pool_domain" "prod" {
  domain       = local.prod_user_pool_name
  user_pool_id = aws_cognito_user_pool.prod.id
}
