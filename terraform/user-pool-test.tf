module "user_pool_test" {
  source = "./modules/user-pool"

  name = local.test_user_pool_name
}
