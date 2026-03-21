terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

resource "jamfpro_static_mobile_device_group" "education_teacher_static_group" {
  provider = jamfpro.jpro
  name     = "Education Teacher"

  lifecycle {
    prevent_destroy = true
  }
}
