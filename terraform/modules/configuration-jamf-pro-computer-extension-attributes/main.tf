terraform {
  required_providers {
    jamfpro = {
      source                = "deploymenttheory/jamfpro"
      configuration_aliases = [jamfpro.jpro]
    }
  }
}

resource "jamfpro_computer_extension_attribute" "zoom_pppc" {
  name                   = "Zoom PPPC"
  description            = "Checks to see if Zoom is installed"
  enabled                = true
  input_type             = "SCRIPT"
  inventory_display_type = "EXTENSION_ATTRIBUTES"
  data_type              = "STRING"

  script_contents = <<-EOF
    #!/bin/zsh
    if [[ -d "/Applications/zoom.us.app" ]]; then
      echo "<result>Installed</result>"
    else
      echo "<result>Not Installed</result>"
    fi
  EOF

  lifecycle {
    prevent_destroy = true
  }
}

resource "jamfpro_computer_extension_attribute" "teams_pppc" {
  name                   = "Teams PPPC"
  description            = "Checks to see if Teams is installed"
  enabled                = true
  input_type             = "SCRIPT"
  inventory_display_type = "EXTENSION_ATTRIBUTES"
  data_type              = "STRING"

  script_contents = <<-EOF
    #!/bin/zsh
    if [[ -d "/Applications/Microsoft Teams.app" ]]; then
      echo "<result>Installed</result>"
    else
      echo "<result>Not Installed</result>"
    fi
  EOF

  lifecycle {
    prevent_destroy = true
  }
}

resource "jamfpro_computer_extension_attribute" "Brew_Installed" {
  name                   = "Is Brew installed"
  description            = "Checks to see if brew is installed"
  enabled                = true
  input_type             = "SCRIPT"
  inventory_display_type = "EXTENSION_ATTRIBUTES"
  data_type              = "STRING"

  script_contents = <<-EOF
    #!/bin/bash
    if [ -x "/opt/workbrew/bin/brew" ]; then
       echo "<result>Installed</result>"
    else
       echo "<result>Not Installed</result>"
    fi
  EOF

  lifecycle {
    prevent_destroy = true
  }
}
