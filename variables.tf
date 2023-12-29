# Copyright (c) Çetin ARDAL
# SPDX-License-Identifier: MIT

locals {
  formatted_timestamp = formatdate("YYYY-MM-DD hh:mm:ss", timestamp())
}

variable "default_tags" {
  type        = map(string)
  description = "a set of tags to watermark the resources you deployed with Terraform."
  default = {
    owner       = "richard" // update me
    terraformed = "Do not edit manually."
  }
}

variable "extra_envs" {
  type        = list(string)
  description = "Extra environments to create branches and workspaces for (prod is implicit)"
  default     = null
}

variable "github_owner" {
  type        = string
  description = "Owner of the Github org"
}

variable "iac_repo_template" {
  type        = string
  description = "Template to use for OAC repo creation"
}

variable "oauth_token_id" {
  type        = string
  description = "Oauth token ID used for associating workspace to VCS"
}

variable "organization" {
  type        = string
  description = "TFC organization"
}

variable "tfc_project_id" {
  type        = string
  description = "ID of the TFC project to house the workspace(s)"
}

variable "project_name" {
  type        = string
  description = "Name of the project to create a landing zone for"
}

variable "project_prefix" {
  type        = string
  description = "Prefix for the TFE project name within the LZ management module"
  default     = "project"
}
