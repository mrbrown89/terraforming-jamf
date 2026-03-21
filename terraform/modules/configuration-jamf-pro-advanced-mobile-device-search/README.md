# Advanced Mobile Searches

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/advanced_mobile_device_search)

## Introduction

This module handles advanced searches in devices


## Terraform

The `main.tf` file should be updated with all advanced device searches:

```
resource "jamfpro_advanced_mobile_device_search" "iOS18_mobile_device_search" {
  name    = "Devices Running iOS 18"

  criteria {
    name          = "OS Version"
    priority      = 0
    and_or        = "and"
    search_type   = "like"
    value         = "18"
    opening_paren = false
    closing_paren = false
  }

  display_fields = [
  "Display Name", "Model", "Asset Tag"]
}
```

In the above example we can see a search for all iOS 18 devices and show the device display name, model and asset tag.
