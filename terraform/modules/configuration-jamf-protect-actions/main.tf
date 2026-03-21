terraform {
  required_providers {
    jamfprotect = {
      source  = "Jamf-Concepts/jamfprotect"
      version = "0.1.0"
    }
  }
}

resource "jamfprotect_action_configuration" "default" {
  name        = "Default"
  description = ""

  alert_data_collection = {
    binary_included_data_attributes                = ["Downloaded From", "Extended Attributes", "Group", "Is App Bundle", "Is Directory", "Is Download", "Is Quarantined", "Is Screenshot", "Sha1", "Sha256", "Signing Information", "User"]
    download_event_included_data_attributes        = ["File"]
    file_included_data_attributes                  = ["Downloaded From", "Extended Attributes", "Group", "Is App Bundle", "Is Directory", "Is Download", "Is Quarantined", "Is Screenshot", "Sha1", "Sha256", "Signing Information", "User"]
    file_system_event_included_data_attributes     = ["File", "Group", "Process", "User"]
    gatekeeper_event_included_data_attributes      = ["Blocked Binary", "Blocked Process"]
    group_included_data_attributes                 = ["Name"]
    keylog_register_event_included_data_attributes = ["Destination Process", "Source Process"]
    process_event_included_data_attributes         = ["Process"]
    process_included_data_attributes               = ["App Path", "Args", "Binary", "Group", "Is GUI App", "Parent", "Process Group Leader", "Signing Information", "User"]
    screenshot_event_included_data_attributes      = ["File"]
    synthetic_click_event_included_data_attributes = ["Group", "Process", "User"]
    user_included_data_attributes                  = ["Name"]
  }

  jamf_protect_cloud_endpoint = {
    collect_alerts = ["high", "informational", "low", "medium"]
    collect_logs   = []
  }
}
