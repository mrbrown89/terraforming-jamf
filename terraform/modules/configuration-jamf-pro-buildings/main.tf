terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

## Create Buildings

resource "jamfpro_building" "office" {
  name = "Office"
  street_address1 = ""
  street_address2 = ""
  city            = ""
  state_province  = ""
  zip_postal_code = ""
  country         = ""
  lifecycle {
    prevent_destroy = true
  }
}
