## Define Jamf Pro provider variables (populated by .tfvars file)
variable "jamfpro_instance_url" {
  description = "Jamf Pro Instance name."
  type        = string
}

variable "jamfpro_auth_method" {
  description = "Jamf Pro Auth Method."
  type        = string
  default     = "oauth2" #basic or oauth2
}

variable "jamfpro_client_id" {
  description = "Jamf Pro Client ID for authentication."
  type        = string
}

variable "jamfpro_client_secret" {
  description = "Jamf Pro Client Secret for authentication."
  type        = string
  sensitive   = true
}

variable "jamfpro_username" {
  description = "Jamf Pro username used for authentication."
  type        = string
  default     = ""
}

variable "jamfpro_password" {
  description = "Jamf Pro password used for authentication."
  type        = string
  sensitive   = true
  default     = ""
}

variable "jamfprotect_url" {
  description = "Jamf Protect URL name."
  type        = string
  default     = ""
}

variable "jamfprotect_client_id" {
  description = "Jamf Protect Client ID for authentication."
  type        = string
  default     = ""
}

variable "jamfprotect_client_password" {
  description = "Jamf Protect Client passwrd for authentication."
  type        = string
  sensitive   = true
  default     = ""
}

## Define JSC provider variables (populated by .tfvars file)
variable "jsc_username" {
  type      = string
  sensitive = false
  default   = ""
}

variable "jsc_password" {
  type      = string
  sensitive = true
  default   = ""
}

variable "jsc_application_id" {
  type      = string
  sensitive = true
  default   = ""
}

variable "jsc_application_secret" {
  type      = string
  sensitive = true
  default   = ""
}

## Define Okta-related variables
variable "tje_okta_client_id" {
  type    = string
  default = "0oadb9ke61k2h6JiT1d7"
}

variable "tje_okta_org_domain" {
  type    = string
  default = "sso.tryjamf.com"
}

variable "include_categories" {
  type    = bool
  default = false
}

variable "include_departments" {
  type        = bool
  description = "Whether to manage Jamf Pro departments via Terraform."
  default     = false
}

variable "departments" {
  type        = list(string)
  description = "Departments to manage in Jamf Pro."
  default     = []
}

variable "include_buildings" {
  type        = bool
  description = "Whether to manage Jamf Pro buildings via Terraform."
  default     = false
}

variable "include_computer_extension_attributes" {
  type        = bool
  description = "Whether to manage Jamf Pro computer extension attributes"
  default     = false
}

variable "include_scripts" {
  type        = bool
  description = "Whether to manage Jamf Pro scripts"
  default     = false
}

variable "include_smart_groups" {
  type        = bool
  description = "Whether to manage Jamf Pro smart computer groups"
  default     = false
}

variable "include_smart_computer_groups" {
  type        = bool
  description = "Whether to manage Jamf Pro smart computer groups"
  default     = false
}

variable "include_smart_device_groups" {
  type        = bool
  description = "Whether to manage Jamf Pro smart device groups"
  default     = false
}

variable "include_advanced_mobile_device_search" {
  type        = bool
  description = "Whether to manage Jamf Pro Device advanced searches"
  default     = false
}

variable "include_cloud_distribution_point" {
  type        = bool
  description = "Handles the cloud distribution point in Jamf"
  default     = false
}

variable "include_policies" {
  type        = bool
  description = "Handles policies"
  default     = false
}

variable "include_self_service_plus_settings" {
  type        = bool
  description = "Enables or disables self service plus"
  default     = false
}

variable "include_prestage_enrollment" {
  type        = bool
  description = "Sets prestage enrollment profiles"
  default     = false
}

variable "prestage_admin_username" {
  type        = string
  description = "Local admin username for PreStage account creation"
  default     = "localadmin"
}

variable "prestage_admin_password" {
  type        = string
  description = "Local admin password for PreStage account creation"
  sensitive   = true
}

variable "include_device_prestage_enrollment" {
  type        = bool
  description = "Device prestage enrollment"
  default     = false
}

variable "include_api_role" {
  type        = bool
  description = "Handles API Roles"
  default     = false
}

variable "include_client_checkin" {
  type        = bool
  description = "Handles checkin frequency"
  default     = false
}
