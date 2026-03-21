# Device Smart Groups

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/smart_mobile_device_group)

## Introduction

Smart groups are key to how our Jamf deployment works. All policies, config profiles and apps are assigned to a smart group.

## Terraform

Lets look at a simple smart group:

```
resource "jamfpro_smart_mobile_device_group_v1" "IT_smart_group" {
  name = "IT Smart Group"
  
  criteria {
    name          = "Department"
    search_type   = "is"
    value         = "IT"
  }

  lifecycle {
    prevent_destroy = true
  }
}
```

