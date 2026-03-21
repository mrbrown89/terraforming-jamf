terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

######################
# SCRIPT LOOKUPS
######################

data "jamfpro_script" "rosetta" {
  name = "InstallRosetta"
}

############################################
############################################
# POLICIES BELOW THIS
############################################
############################################



# Install Rosetta
resource "jamfpro_policy" "install_rosetta" {
  name            = "Rosetta"
  enabled         = true
  trigger_checkin = true
  trigger_other   = "Rosetta"
  frequency       = "Once per computer"
  category_id = tonumber(data.jamfpro_category.global.id)

  scope {
    all_computers = true
  }

  payloads {
    scripts {
        id       = tonumber(data.jamfpro_script.rosetta.id)
        priority = "Before"
    }
  }
}
