terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}


# Jamf Connect Group
resource "jamfpro_static_computer_group" "jamf_connect_group" {
  provider = jamfpro.jpro
  name     = "Jamf Connect Group"

  lifecycle {
    prevent_destroy = true
  }
}
