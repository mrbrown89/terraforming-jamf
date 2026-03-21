terraform {
  required_providers {
    jamfprotect = {
      source  = "Jamf-Concepts/jamfprotect"
      version = "0.1.0"
    }
  }
}

resource "jamfprotect_removable_storage_control_set" "serial_allow_list" {
  name        = "Removable Storage"
  description = "This is managed with Terraform. Please update the configuration-jamf-protect-removable-storage-control-sets module and apply with Terraform"

  default_permission                 = "Prevent"
  default_local_notification_message = "This removable storage device is not allowed. Please contact IT"

  override_serial_number = [
    {
      apply_to                   = "All"
      permission                 = "Read and Write"
      local_notification_message = "Corporate USB device detected and allowed."

      serial_numbers = [
        "238E3208",
        "816820090226",
        "1B1C1AB68D012CA98518AA57"
      ]
    }
  ]
}
