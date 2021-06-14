locals {
  dev_user_pool_name  = "dev-user-pool"
  test_user_pool_name = "test-user-pool"
  prod_user_pool_name = "prod-user-pool"
}

# module "teams" {
#   source = "./teams"

#   dev_user_pool_id  = aws_cognito_user_pool.dev.id
#   test_user_pool_id = aws_cognito_user_pool.test.id
#   prod_user_pool_id = aws_cognito_user_pool.prod.id
# }
