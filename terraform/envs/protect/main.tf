module "removable_storage_control_set" {
  source = "../../modules/configuration-jamf-protect-removable-storage-control-sets"

  jamfprotect_url           = var.jamfprotect_url
  jamfprotect_client_id     = var.jamfprotect_client_id
  jamfprotect_client_secret = var.jamfprotect_client_secret
}

module "actions" {
  source = "../../modules/configuration-jamf-protect-actions"

  jamfprotect_url           = var.jamfprotect_url
  jamfprotect_client_id     = var.jamfprotect_client_id
  jamfprotect_client_secret = var.jamfprotect_client_secret
}

module "plans" {
  source = "../../modules/configuration-jamf-protect-plans"

  jamfprotect_url           = var.jamfprotect_url
  jamfprotect_client_id     = var.jamfprotect_client_id
  jamfprotect_client_secret = var.jamfprotect_client_secret
}
