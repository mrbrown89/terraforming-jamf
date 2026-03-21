# Computer Static Groups

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/static_mobile_device_group)

## Introduction

Static groups aren't used as much as we used to use them as we now favour smart groups, however, they are still helpful in some areas e.g. for testing.

## Terraform

Unlike smart groups, static groups are straight forward:

```
resource "jamfpro_static_mobile_device_group" "education_teacher_static_group" {
  provider = jamfpro.jpro
  name     = "Education Teacher"

  lifecycle {
    prevent_destroy = true
  }
}
```

All we are doing is creating a group. Once in Jamf, you then assign devices to the group.
