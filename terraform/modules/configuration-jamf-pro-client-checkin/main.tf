terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

resource "jamfpro_client_checkin" "jamfpro_client_checkin" {
  check_in_frequency                  = 15
  create_startup_script               = true
  startup_log                         = false
  startup_ssh                         = false
  startup_policies                    = true
  create_hooks                        = true
  hook_log                            = false
  hook_policies                       = true
  enable_local_configuration_profiles = true
  allow_network_state_change_triggers = true
}
