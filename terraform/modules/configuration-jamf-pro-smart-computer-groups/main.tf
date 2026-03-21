terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

resource "jamfpro_smart_computer_group_v2" "it_smart_group" {
  name = "IT Smart Group"

  criteria {
    name        = "Department"
    search_type = "is"
    value       = "IT"
  }

  criteria {
    name        = "Enrollment Method: PreStage enrollment"
    priority    = 1
    and_or      = "or"
    search_type = "is"
    value       = "IT - Terraform"
  }

  lifecycle {
    prevent_destroy = true
  }
}
