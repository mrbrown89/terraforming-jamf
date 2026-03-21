# Terraforming Jamf

Welcome to my Terraforming Jamf repo!

## Goals

- Provide a real-world Terraform structure for Jamf Pro
- Enable a dev to test to prod workflow
- Encourage safe and repeatable Jamf configuration changes
- Support Jamf Protect configuration via Terraform modules
- Act as a learning resource for others adopting Terraform with Jamf

## Repository Structure

- terraform/modules/
  Reusable Terraform modules for Jamf Pro and Jamf Protect resources

- env/dev/
  Development environment for safe testing

- env/prod/
  Production environment only applied after validation

## Workflow

1. Develop changes in dev
2. Validate via CI or testing processes
3. Review and confirm expected behaviour
4. Promote to prod using terraform apply

This ensures production Jamf instances are only updated with tested and verified configurations.

## Secrets Management

This repository requires a secrets file containing sensitive credentials such as API client details.

Important:

- This file must not be committed to Git
- Use .gitignore to exclude it
- Consider using environment variables or a secrets manager

## Jamf Protect Support

This repo includes modules for:

- Protect plans
- Data retention
- Actions
- Change management
- Removable storage controls

These are optional but provide a strong foundation for integrating endpoint security into your Terraform workflow.

## Style Guide

This repository loosely follows the Terraform structure and conventions outlined by the Jamf [Concepts Terraform Style Guide](https://github.com/Jamf-Concepts/terraform-jamf-platform/blob/main/STYLE_GUIDE.md).

## Disclaimer

This is a guide and reference implementation, not a one size fits all solution.

You should:

- Review all configurations before applying
- Adapt modules to your organisation’s needs
- Test thoroughly in a non production environment

