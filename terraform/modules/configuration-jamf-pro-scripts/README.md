# Scripts

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/script)

## Introduction

Scripts are mega important on macs. They are used when making policies and are heavily used in our environment.

## Terraform

Scripts need to be developed in the `scripts` directory of this module. A script under development will not be deployed until you add a resource for it in `main.tf`.

Lets have a look at a resource:

```
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
```
