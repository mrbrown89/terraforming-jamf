terraform {
  required_providers {
    jamfprotect = {
      source  = "Jamf-Concepts/jamfprotect"
      version = "0.1.0"
    }
  }
}

resource "jamfprotect_change_management" "singleton" {
  enable_freeze = false
}

