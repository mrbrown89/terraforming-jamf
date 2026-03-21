variable "jamfprotect_url" {
  description = "Jamf Protect tenant URL"
  type        = string
  sensitive   = true
}

variable "jamfprotect_client_id" {
  description = "Jamf Protect API client ID"
  type        = string
  sensitive   = true
}

variable "jamfprotect_client_secret" {
  description = "Jamf Protect API client secret"
  type        = string
  sensitive   = true
}
