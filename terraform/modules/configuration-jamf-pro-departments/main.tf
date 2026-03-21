terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

## Create Departments

resource "jamfpro_department" "design" {
  name = "Design"
  lifecycle { prevent_destroy = true }
}

resource "jamfpro_department" "education" {
  name = "Education"
  lifecycle { prevent_destroy = true }
}

resource "jamfpro_department" "it" {
  name = "IT"
  lifecycle { prevent_destroy = true }
}
