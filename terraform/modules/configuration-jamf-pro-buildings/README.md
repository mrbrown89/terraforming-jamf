# Buildings

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/building)

## Introduction

Fairly straight forward this one! Simply fill out the `""`. In the example in `main.tf` I created a building called `office`.

## Terraform

The `main.tf` file shouldn't need to be updated unless we end up with another building somewhere but lets look at a resource:

```
resource "jamfpro_building" "" {
  name = "Office"
  street_address1 = ""
  street_address2 = ""
  city            = ""
  state_province  = ""
  zip_postal_code = ""
  country         = ""
  lifecycle {
    prevent_destroy = true
  }
}
```

The resource pretty much explains itself. It you need to add another building then copy the above, change `galleries` entries to something more meaningful and then edit the address.
