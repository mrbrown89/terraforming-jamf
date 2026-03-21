terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

######################
# PROFILE ID LOOKUPS
######################

data "jamfpro_macos_configuration_profile_plist" "connect_login" {
  name = "Connect Login"
}

data "jamfpro_macos_configuration_profile_plist" "connect_menu_bar" {
  name = "Connect Menu Bar"
}

data "jamfpro_macos_configuration_profile_plist" "jamf_connect" {
  name = "Jamf Connect"
}

data "jamfpro_macos_configuration_profile_plist" "jamf_setup_manager" {
  name = "Jamf Setup Manager"
}

######################
# PACKAGE LOOKUPS
######################

data "jamfpro_package" "jamf_connect" {
  package_name = "JamfConnect.pkg"
}

data "jamfpro_package" "jamf_connect_launch_agent" {
  package_name = "JamfConnectLaunchAgent.pkg"
}

data "jamfpro_package" "jamf_setup_manager" {
  package_name = "Jamf Setup Manager.1.0-368.pkg"
}


# IT Prestage
resource "jamfpro_computer_prestage_enrollment" "it_prestage" {
  display_name                          = "IT - Terraform"
  mandatory                             = true
  mdm_removable                         = false
  support_phone_number                  = ""
  support_email_address                 = ""
  department                            = "IT"
  default_prestage                      = false
  enrollment_site_id                    = "-1"
  keep_existing_site_membership         = false
  keep_existing_location_information    = false
  require_authentication                = false
  authentication_prompt                 = ""
  prevent_activation_lock               = true
  enable_device_based_activation_lock   = false
  device_enrollment_program_instance_id = "1"
  skip_setup_items {
    biometric                   = false
    terms_of_address            = true
    file_vault                  = false
    icloud_diagnostics          = true
    diagnostics                 = true
    accessibility               = true
    apple_id                    = true
    screen_time                 = true
    siri                        = true
    display_tone                = true
    restore                     = true
    appearance                  = false
    privacy                     = false
    additional_privacy_settings = false
    payment                     = true
    registration                = true
    tos                         = true
    icloud_storage              = true
    location                    = false
    intelligence                = false
    software_update             = false
    enable_lockdown_mode        = true
    welcome                     = false
    wallpaper                   = false
    os_showcase                 = true
  }
  location_information {
    username      = ""
    realname      = ""
    phone         = ""
    email         = ""
    room          = ""
    position      = ""
    department_id = "-1"
    building_id   = "-1"
  }
  purchasing_information {
    leased             = false
    purchased          = true
    apple_care_id      = ""
    po_number          = ""
    vendor             = ""
    purchase_price     = ""
    life_expectancy    = 5
    purchasing_account = ""
    purchasing_contact = ""
    lease_date         = "1970-01-01"
    po_date            = "1970-01-01"
    warranty_date      = "1970-01-01"
  }
  anchor_certificates           = []
  enrollment_customization_id   = "0"
  language                      = "en"
  region                        = "GB"
  auto_advance_setup            = true
  install_profiles_during_setup = true
  prestage_installed_profile_ids = [
    data.jamfpro_macos_configuration_profile_plist.connect_login.id,
    data.jamfpro_macos_configuration_profile_plist.connect_menu_bar.id,
    data.jamfpro_macos_configuration_profile_plist.jamf_connect.id,
    data.jamfpro_macos_configuration_profile_plist.jamf_setup_manager.id
  ]
  custom_package_ids = [
    data.jamfpro_package.jamf_connect.id,
    data.jamfpro_package.jamf_connect_launch_agent.id,
    data.jamfpro_package.jamf_setup_manager.id
  ]
  custom_package_distribution_point_id    = "-2"
  enable_recovery_lock                    = false
  recovery_lock_password_type             = "MANUAL" // "MANUAL" / "RANDOM"
  recovery_lock_password                  = ""
  rotate_recovery_lock_password           = false
  prestage_minimum_os_target_version_type = "NO_ENFORCEMENT"
  minimum_os_specific_version             = ""
  site_id                                 = "-1"
  account_settings {
    payload_configured                           = true
    local_admin_account_enabled                  = true
    admin_username                               = var.prestage_admin_username
    admin_password                               = var.prestage_admin_password
    hidden_admin_account                         = false
    local_user_managed                           = false
    user_account_type                            = "ADMINISTRATOR"
    prefill_primary_account_info_feature_enabled = false
    prefill_type                                 = "CUSTOM"
    prefill_account_full_name                    = ""
    prefill_account_user_name                    = ""
    prevent_prefill_info_from_modification       = false
  }
}
