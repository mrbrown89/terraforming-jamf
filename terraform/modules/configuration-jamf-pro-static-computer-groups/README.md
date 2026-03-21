# Computer Static Groups

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/static_computer_group)

## Introduction

Static groups aren't used as much as we used to use them as we now favour smart groups, however, they are still helpful in some areas e.g. for testing.

## Terraform

Unlike smart groups, static groups are straight forward:

```
# Jamf Connect Group
resource "jamfpro_static_computer_group" "jamf_connect_group" {
  provider = jamfpro.jpro
  name     = "Jamf Connect Group"

  lifecycle {
    prevent_destroy = true
  }
}
```

All we are doing is creating a group. Once in Jamf, you then assign devices to the group.
