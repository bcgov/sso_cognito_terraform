module "app-client-dev" {
  source       = "../modules/user-pool-client"
  user_pool_id = var.dev_user_pool_id

  name                         = "client-blue"
  supported_identity_providers = ["github"]

  callback_urls = ["http://localhost:3000"]
  logout_urls   = []
}
