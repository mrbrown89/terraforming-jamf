# Computer Smart Groups

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/smart_computer_group_v2)

## Introduction

Smart groups are key to how our Jamf deployment works. All policies, config profiles and apps are assigned to a smart group.

## Terraform

Lets look at a simple smart group:

```
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
```

The above is an example of creating a smart group based on a department or prestage. Make sure you follow the terraform documentation for all the bits needed in the resource.
