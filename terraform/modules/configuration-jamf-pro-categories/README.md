# Categories

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/category)

## Introduction

The categories stuff isn't needed for Jamf to work but it does give us a nice way to group things like config profiles, policies, scripts etc into nice categories. 

Basically a nice way to view things! 

## Terraform

The `main.tf` file can be updated every time you need to add a new category. To add a category simply copy and paste a resource at the bottom of the file.

Lets look at the wifi category resource as an example:

```
resource "jamfpro_category" "wifi" {
  name     = "WiFi"
  priority = 9
  lifecycle { prevent_destroy = true }
}
```
