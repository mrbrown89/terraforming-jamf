# Computer Extension Attributes

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/computer_extension_attribute)

## Introduction

Extension attributes (EA) are used to find a specific bit of information about a computer and to do something with that information. 

For example, has a computer got x app installed. 

## Terraform

We need to define our script in the resource as well as all the information needed. Lets look at the 'is Brew installed' attribute:

```
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
```

Lets break this down:

```
  name                   = "Is Brew installed"
  description            = "Checks to see if brew is installed"
  enabled                = true
  input_type             = "SCRIPT"
  inventory_display_type = "EXTENSION_ATTRIBUTES"
  data_type              = "STRING"
```

In the above block we can see the name and description of the EA. Next we see `enabled` which we want to be `true` if we want the EA to be in use! Next we need to define what input type we are using for our EA. At time of writing we only use script based EAs to make sure the input type is `SCRIPT`. Next is the `inventory_display_type`. This is where we want the EA to appear in a computer's inventory record. We want this is be `EXTENSION_ATTRIBUTES` always. Finally we have the `data_type` of `STRING`. This is telling Jamf what the returned value will be. In the case of our example EA the returned value will be a string.
