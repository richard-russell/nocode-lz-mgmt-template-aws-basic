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
| [github_branch.extra_envs](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/branch) | resource |
| [github_repository.iac](https://registry.terraform.io/providers/hashicorp/github/latest/docs/resources/repository) | resource |
| [tfe_workspace.extra_envs](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |
| [tfe_workspace.prod](https://registry.terraform.io/providers/hashicorp/tfe/latest/docs/resources/workspace) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| default\_tags | a set of tags to watermark the resources you deployed with Terraform. | `map(string)` | <pre>{<br>  "owner": "richard",<br>  "terraformed": "Do not edit manually."<br>}</pre> | no |
| extra\_envs | Extra environments to create branches and workspaces for (prod is implicit) | `list(string)` | `null` | no |
| github\_owner | Owner of the Github org | `string` | n/a | yes |
| iac\_repo\_template | Template to use for OAC repo creation | `string` | n/a | yes |
| oauth\_token\_id | Oauth token ID used for associating workspace to VCS | `string` | n/a | yes |
| organization | TFC organization | `string` | n/a | yes |
| project\_name | Name of the project to create a landing zone for | `string` | n/a | yes |
| project\_prefix | Prefix for the TFE project name within the LZ management module | `string` | `"project"` | no |
| tfc\_project\_id | ID of the TFC project to house the workspace(s) | `string` | n/a | yes |

### Outputs

No outputs.

<!-- END_TF_DOCS -->