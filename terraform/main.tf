locals {
  dev_user_pool_name  = "dev-user-pool"
  test_user_pool_name = "test-user-pool"
  prod_user_pool_name = "prod-user-pool"
}

module "teams" {
  source = "./teams"

  dev_user_pool_id  = module.user_pool_dev.id
  test_user_pool_id = module.user_pool_test.id
  prod_user_pool_id = module.user_pool_prod.id
}
