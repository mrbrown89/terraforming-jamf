terraform {
  required_providers {
    jamfprotect = {
      source  = "Jamf-Concepts/jamfprotect"
      version = "0.1.0"
    }
  }
}

provider "jamfprotect" {
  url           = var.jamfprotect_url
  client_id     = var.jamfprotect_client_id
  client_secret = var.jamfprotect_client_secret
}
