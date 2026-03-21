# Computer Config Profiles

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/macos_configuration_profile_plist)

## Introduction

You can create config profiles using tools like iMazing and then upload them to Jamf via terraform.

In this module, you'll put your config profiles into the profiles directory and then write a resource for them in `main.tf`. In this example I put a data source lookup to query Jamf for the ID I'm assigning the category to.

