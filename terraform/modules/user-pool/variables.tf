# see https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cognito_user_pool_client
variable "name" {
  description = "Name of the user pool"
}

variable "priority_recovery_mechanism" {
  description = "Priority account recovery option"
  default     = "verified_email"
}

variable "allow_admin_create_user_only" {
  description = "Whether only the administrator is allowed to create user profiles"
  type        = bool
  default     = true
}

# The options are: 'phone_number', 'email', 'preferred_username'. Conflicts with 'username_attributes' variable.
variable "alias_attributes" {
  description = "Attributes supported as an alias for this user pool"
  type        = list(string)
  default     = []
}

# The options are: 'email', 'phone_number'.
variable "auto_verified_attributes" {
  description = "Attributes to be auto-verified"
  type        = list(string)
  default     = []
}

# The options are: 'ON', 'OFF'.
variable "mfa_configuration" {
  description = "Multi-Factor Authentication (MFA) configuration for the User Pool"
  type        = string
  default     = "OFF"
}

variable "password_policy_minimum_length" {
  description = "Minimum length of the password policy that you have set"
  type        = number
  default     = 8
}

variable "password_policy_require_lowercase" {
  description = "Whether you have required users to use at least one lowercase letter in their password"
  type        = bool
  default     = true
}

variable "password_policy_require_numbers" {
  description = "Whether you have required users to use at least one number in their password"
  type        = bool
  default     = true
}

variable "password_policy_require_symbols" {
  description = "Whether you have required users to use at least one symbol in their password"
  type        = bool
  default     = true
}

variable "password_policy_require_uppercase" {
  description = "Whether you have required users to use at least one uppercase letter in their password"
  type        = bool
  default     = true
}

variable "password_policy_temporary_password_validity_days" {
  description = "The number of days a temporary password is valid"
  type        = number
  default     = 7
}
