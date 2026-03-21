## Call Terraform provider
terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

## Create Categories

resource "jamfpro_category" "ai" {
  name     = "AI"
  priority = 9

  lifecycle {
    prevent_destroy = true
  }
}

resource "jamfpro_category" "brew" {
  name     = "Brew"
  priority = 9
  lifecycle { prevent_destroy = true }
}
