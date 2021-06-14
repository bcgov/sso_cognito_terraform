resource "aws_cognito_user_pool" "test" {
  name = local.test_user_pool_name
}

resource "aws_cognito_user_pool_domain" "test" {
  domain       = local.test_user_pool_name
  user_pool_id = aws_cognito_user_pool.test.id
}
