# Nocode Landing Zone Management Workspace Template - AWS Basic

## About

This template for a LZ management workspace creates a simple landing zone:
- One repo
- One workspace

The workspace is created in the LZ project.


## Terraform Configuration information

<!-- BEGIN_TF_DOCS -->

### Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.5.0 |

### Modules

No modules.

### Resources

| Name | Type |
|------|------|
| [github_repository.iac](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| default\_tags | a set of tags to watermark the resources you deployed with Terraform. | `map(string)` | <pre>{<br>  "owner": "richard",<br>  "terraformed": "Do not edit manually."<br>}</pre> | no |
| github\_owner | Owner of the Github org | `string` | n/a | yes |
| iac\_repo\_template | Template to use for OAC repo creation | `string` | n/a | yes |
| oauth\_token\_id | Oauth token ID used for associating workspace to VCS | `string` | n/a | yes |
| organization | TFC organization | `string` | n/a | yes |
| project\_name | Name of the project to create a landing zone for | `string` | n/a | yes |
| project\_prefix | Prefix for the TFE project name within the LZ management module | `string` | `"project"` | no |

### Outputs

No outputs.

<!-- END_TF_DOCS -->