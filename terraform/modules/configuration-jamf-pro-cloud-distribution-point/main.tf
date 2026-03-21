terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

resource "jamfpro_cloud_distribution_point" "jamf_cloud" {
  cdn_type = "JAMF_CLOUD"
  master   = true
}
