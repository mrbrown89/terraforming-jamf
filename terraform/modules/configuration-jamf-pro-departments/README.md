# Departments

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/department)

## Introduction

Departments are a global building block of Jamf. Jamf doesn't need departments to work but four our use case we need departments as new devices are scoped to these departments during pre-stage enrolment. Departments are used in the criteria for smart groups so they are rather key to devices getting the correct settings!

## Terraform

These resources are rather easy:

```
resource "jamfpro_department" "design" {
  name = "Design"
  lifecycle { prevent_destroy = true }
}
```

Lets assume you have a department called `Coffee`. Just copy an existing resource and paste it at the bottom of `main.tf` and edit the name so for example:

```
resource "jamfpro_department" "Coffee" {
  name = "Coffee"
  lifecycle { prevent_destroy = true }
}
```
