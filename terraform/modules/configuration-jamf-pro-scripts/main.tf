terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

resource "jamfpro_script" "install_rosetta" {
  name            = "InstallRosetta"
  script_contents = file("${path.module}/scripts/InstallRosetta.sh")

  priority = "AFTER"
  info     = "Script will install rosetta on macs"
  notes    = ""

  lifecycle {
    prevent_destroy = true
  }
}
