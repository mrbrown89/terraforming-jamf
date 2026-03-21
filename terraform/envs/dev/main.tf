## Jamf Pro provider root configuration
provider "jamfpro" {
  jamfpro_instance_fqdn                = var.jamfpro_instance_url
  auth_method                          = var.jamfpro_auth_method
  basic_auth_username                  = var.jamfpro_username
  basic_auth_password                  = var.jamfpro_password
  client_id                            = var.jamfpro_client_id
  client_secret                        = var.jamfpro_client_secret
  enable_client_sdk_logs               = false
  hide_sensitive_data                  = true # Hides sensititve data in logs
  token_refresh_buffer_period_seconds  = 5    # minutes
  jamfpro_load_balancer_lock           = true
  mandatory_request_delay_milliseconds = 100
}

# JSC provider root configuration
provider "jsc" {
  username          = var.jsc_username
  password          = var.jsc_password
  applicationid     = var.jsc_application_id
  applicationsecret = var.jsc_application_secret
}

module "configuration-jamf-pro-categories" {
  count                 = var.include_categories == true ? 1 : 0
  source                = "../../modules/configuration-jamf-pro-categories"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-departments" {
  count                 = var.include_departments ? 1 : 0
  source                = "../../modules/configuration-jamf-pro-departments"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-buildings" {
  count  = var.include_buildings ? 1 : 0
  source = "../../modules/configuration-jamf-pro-buildings"

  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret

  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-computer-extension-attributes" {
  count                 = var.include_computer_extension_attributes ? 1 : 0
  source                = "../../modules/configuration-jamf-pro-computer-extension-attributes"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-scripts" {
  count                 = var.include_scripts ? 1 : 0
  source                = "../../modules/configuration-jamf-pro-scripts"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret

  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-smart-computer-groups" {
  count  = var.include_smart_computer_groups ? 1 : 0
  source = "../../modules/configuration-jamf-pro-smart-computer-groups"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret

  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-smart-device-groups" {
  count  = var.include_smart_device_groups ? 1 : 0
  source = "../../modules/configuration-jamf-pro-smart-device-groups"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret

  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-advanced-mobile-device-search" {
  count  = var.include_advanced_mobile_device_search ? 1 : 0
  source = "../../modules/configuration-jamf-pro-advanced-mobile-device-search"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret

  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-cloud-distribution-point" {
  count  = var.include_cloud_distribution_point ? 1 : 0
  source = "../../modules/configuration-jamf-pro-cloud-distribution-point"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret

  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-policies" {
  count  = var.include_policies ? 1 : 0
  source = "../../modules/configuration-jamf-pro-policies"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret

  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-self-service-plus-settings" {
  count  = var.include_self_service_plus_settings ? 1 : 0
  source = "../../modules/configuration-jamf-pro-self-service-plus-settings"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret

  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-computer-prestage-enrollment" {
  count  = var.include_prestage_enrollment  ? 1 : 0
  source = "../../modules/configuration-jamf-pro-computer-prestage-enrollment"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  prestage_admin_username =  var.prestage_admin_username
  prestage_admin_password =  var.prestage_admin_password
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-device-prestage-enrollment" {
  count  = var.include_device_prestage_enrollment  ? 1 : 0
  source = "../../modules/configuration-jamf-pro-device-prestage-enrollment"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-api-role" {
  count  = var.include_api_role  ? 1 : 0
  source = "../../modules/configuration-jamf-pro-api-role"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}

module "configuration-jamf-pro-client-checkin" {
  count  = var.include_client_checkin  ? 1 : 0
  source = "../../modules/configuration-jamf-pro-client-checkin"
  jamfpro_instance_url  = var.jamfpro_instance_url
  jamfpro_client_id     = var.jamfpro_client_id
  jamfpro_client_secret = var.jamfpro_client_secret
  providers = {
    jamfpro.jpro = jamfpro.jpro
  }
}
