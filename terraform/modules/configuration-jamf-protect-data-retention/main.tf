terraform {
  required_providers {
    jamfprotect = {
      source  = "Jamf-Concepts/jamfprotect"
      version = "0.1.0"
    }
  }
}

resource "jamfprotect_data_retention" "singleton" {
  archived_data_days                  = 365
  informational_alert_days            = 365
  low_medium_high_severity_alert_days = 365
}
