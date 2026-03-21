# Jamf Protect Removable Storage Sets

[Resource documentation](https://registry.terraform.io/providers/Jamf-Concepts/jamfprotect/latest/docs/resources/removable_storage_control_set)

## Introduction

When a new USB storage device is needed on a mac, you will need to update this module. 

## Terraform

In the `main.tf` file you'll see the serial number block:

```
      erial_numbers = [
        "238E3208",
        "816820090226",
        ...
        ...
        ]
```

You will need to put your serial number into that list and apply the config.
