terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

resource "jamfpro_advanced_mobile_device_search" "iOS26_mobile_device_search" {
  name    = "Devices Running iOS 26 - Terraform"

  criteria {
    name          = "OS Version"
    priority      = 0
    and_or        = "and"
    search_type   = "like"
    value         = "26"
    opening_paren = false
    closing_paren = false
  }

  display_fields = [
  "Display Name", "Model", "Asset Tag"]
}

resource "jamfpro_advanced_mobile_device_search" "iOS26_3_1_mobile_device_search" {
  name    = "Devices Running iOS 26.3.1 - Terraform"

  criteria {
    name          = "OS Version"
    priority      = 0
    and_or        = "and"
    search_type   = "is"
    value         = "26.3.1"
    opening_paren = false
    closing_paren = false
  }

  display_fields = [
  "Display Name", "Model", "Asset Tag"]
}
