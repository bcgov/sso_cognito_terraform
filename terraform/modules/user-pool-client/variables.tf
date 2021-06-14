# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client
variable "name" {
  description = "Name of the application client"
}

variable "user_pool_id" {
  description = "User pool the client belongs to"
}

variable "generate_secret" {
  description = "Whether to generate an application secret"
  type        = bool
  default     = true
}

variable "supported_identity_providers" {
  description = "List of provider names for the identity providers that are supported on this client"
  type        = list(string)
  default     = []
}

variable "callback_urls" {
  description = "List of allowed callback URLs for the identity providers"
  type        = list(string)
  default     = []
}

variable "logout_urls" {
  description = "List of allowed logout URLs for the identity providers"
  type        = list(string)
  default     = []
}

variable "allowed_oauth_flows_user_pool_client" {
  description = "Whether the client is allowed to follow the OAuth protocol when interacting with Cognito user pools"
  type        = bool
  default     = true
}

# The options are: 'code', 'implicit', 'client_credentials'.
variable "allowed_oauth_flows" {
  description = "List of allowed OAuth flows"
  type        = list(string)
  default     = ["code"]
}

# The options are: 'phone', 'email', 'openid', 'profile', and 'aws.cognito.signin.user.admin'.
variable "allowed_oauth_scopes" {
  description = "List of allowed OAuth scopes"
  type        = list(string)
  default     = ["openid", "email", "profile"]
}

# The options are:
#   ADMIN_NO_SRP_AUTH
#   CUSTOM_AUTH_FLOW_ONLY
#   USER_PASSWORD_AUTH
#   ALLOW_ADMIN_USER_PASSWORD_AUTH
#   ALLOW_CUSTOM_AUTH
#   ALLOW_USER_PASSWORD_AUTH
#   ALLOW_USER_SRP_AUTH
#   ALLOW_REFRESH_TOKEN_AUTH
variable "explicit_auth_flows" {
  description = "List of authentication flows"
  type        = list(string)
  default     = ["ALLOW_CUSTOM_AUTH", "ALLOW_USER_SRP_AUTH", "ALLOW_REFRESH_TOKEN_AUTH"]
}

# The time unit is defined in token_validity_units.
variable "id_token_validity" {
  description = "Time limit that id tokens are valid for"
  type        = number
  default     = 60 # 60 minutes
}

# The time unit is defined in token_validity_units.
# The valid range is between 5 minutes and 1 day.
variable "access_token_validity" {
  description = "Time limit that access tokens are valid for"
  type        = number
  default     = 60 # 60 minutes
}

# The time unit is defined in token_validity_units.
variable "refresh_token_validity" {
  description = "Time limit that refresh tokens are valid for"
  type        = number
  default     = 30 # 30 days
}

# Valid values are 'seconds', 'minutes', 'hours' or 'days'.
variable "token_validity_unit_id_token" {
  description = "Time unit in for the value in id_token_validity"
  type        = string
  default     = "minutes"
}

# Valid values are 'seconds', 'minutes', 'hours' or 'days'.
variable "token_validity_unit_access_token" {
  description = "Time unit in for the value in access_token_validity"
  type        = string
  default     = "minutes"
}

# Valid values are 'seconds', 'minutes', 'hours' or 'days'.
variable "token_validity_unit_refresh_token" {
  description = "Time unit in for the value in refresh_token_validity"
  type        = string
  default     = "days"
}

# When set to 'ENABLED' and the user does not exist, authentication returns an error indicating either the username or password was incorrect, and account confirmation and password recovery return a response indicating a code was sent to a simulated destination.
# When set to 'LEGACY', those APIs will return a UserNotFoundException exception if the user does not exist in the user pool.
variable "prevent_user_existence_errors" {
  description = "Which errors and responses are returned by Cognito APIs when the user does not exist in the user pool"
  type        = string
  default     = "ENABLED"
}

variable "read_attributes" {
  description = "List of user pool attributes the application client can read from"
  type        = list(string)
  default = [
    "address",
    "birthdate",
    "email",
    "email_verified",
    "family_name",
    "gender",
    "given_name",
    "locale",
    "middle_name",
    "name",
    "nickname",
    "phone_number",
    "phone_number_verified",
    "picture",
    "preferred_username",
    "profile",
    "updated_at",
    "website",
    "zoneinfo",
  ]
}

variable "write_attributes" {
  description = "List of user pool attributes the application client can write to"
  type        = list(string)
  default = [
    # "address",
    # "birthdate",
    # "email",
    # "family_name",
    # "gender",
    # "given_name",
    # "locale",
    # "middle_name",
    # "name",
    # "nickname",
    # "phone_number",
    # "picture",
    # "preferred_username",
    # "profile",
    # "updated_at",
    # "website",
    # "zoneinfo",
  ]
}
