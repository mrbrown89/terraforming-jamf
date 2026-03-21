terraform {
  required_providers {
    jamfprotect = {
      source  = "Jamf-Concepts/jamfprotect"
      version = "0.1.0"
    }
  }
}

resource "jamfprotect_plan" "nsc" {
  name        = "<Put your plan name here>"
  description = ""

  action_configuration          = "1"
  advanced_threat_controls      = "Block and report"
  analytic_sets                 = ["6c1ee309-dc01-4a50-b9f9-a24fccfbf773"]
  auto_update                   = true
  communications_protocol       = "MQTT:443"
  compliance_baseline_reporting = true
  endpoint_threat_prevention    = "Block and report"
  log_level                     = "Error"
  removable_storage_control_set = "35"

  report_architecture   = true
  report_hostname       = true
  report_kernel_version = true
  report_memory_size    = true
  report_model_name     = true
  report_os_version     = true
  report_serial_number  = true

  reporting_interval = 10

  tamper_prevention = "Block and report"
}
