# Copyright (c) Çetin ARDAL
# SPDX-License-Identifier: MIT

terraform {
  # Terraform cli version
  required_version = ">= 1.5.0"
}

locals {
  project_fullname = "${var.project_prefix}-${var.project_name}"
  repo_name        = "${local.project_fullname}-iac"
}

resource "github_repository" "iac" {
  name        = local.repo_name
  description = "IAC repo for project ${var.project_name}"

  visibility = "private"

  template {
    owner                = var.github_owner
    repository           = var.iac_repo_template
    include_all_branches = false
  }
}

resource "tfe_workspace" "prod" {
  name         = local.repo_name
  organization = var.organization
  project_id   = var.tfc_project_id
  tag_names    = ["prod", "iac", "lz", var.project_name]
  vcs_repo {
    branch         = "main"
    identifier     = github_repository.iac.full_name
    oauth_token_id = var.oauth_token_id
  }

}

resource "github_branch" "extra_envs" {
  for_each   = toset(var.extra_envs)
  repository = github_repository.iac.name
  branch     = each.key
}

resource "tfe_workspace" "extra_envs" {
  for_each     = toset(github_branch.extra_envs.*.branch)
  name         = "${local.project_fullname}-${each.key}"
  organization = var.organization
  project_id   = var.tfc_project_id
  tag_names    = [each.key, "iac", "lz", var.project_name]
  vcs_repo {
    branch         = each.key
    identifier     = github_repository.iac.full_name
    oauth_token_id = var.oauth_token_id
  }
}