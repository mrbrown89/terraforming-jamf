terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

######################
# CATEGORY LOOKUPS
######################

data "jamfpro_category" "global" {
  name = "Global"
}


######################
# CONFIG PROFILES
######################

resource "jamfpro_macos_configuration_profile_plist" "block_tips_notifications" {
  category_id         = tonumber(data.jamfpro_category.global.id)
  description         = "Blocks the annoying 'Tips' pop ups"
  distribution_method = "Install Automatically"
  level               = "System"
  name                = "Block Tips Notifications - Terraform"
  payload_validate    = true
  payloads            = file("${path.module}/profiles/Block Tips Notifications.mobileconfig")
  redeploy_on_update  = "Newly Assigned"
  user_removable      = false

  scope {
    all_computers = true
    all_jss_users = false
    building_ids  = []
    computer_group_ids = []
    computer_ids       = []
    department_ids     = []
    jss_user_group_ids = []
    jss_user_ids       = []
  }
}

