module "user_pool_prod" {
  source = "./modules/user-pool"

  name = local.prod_user_pool_name
}
