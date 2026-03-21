# Computer Pre Stage Enrollment Profiles

[Resource documentation](https://registry.terraform.io/providers/deploymenttheory/jamfpro/latest/docs/resources/computer_prestage_enrollment)

## Introduction

The `main.tf` file looks like a lot! But don't be put off. I've included an example of a prestage to deploy to IT which includes some packages for Jamf Connect and Jamf Setup Manager.

There are some look ups going on in this module. Lets take a look at one:

```
data "jamfpro_macos_configuration_profile_plist" "connect_login" {
  name = "Connect Login"
}
```

And then we call it with:

```
  prestage_installed_profile_ids = [
    data.jamfpro_macos_configuration_profile_plist.connect_login.id,
    ]
```
