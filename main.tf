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

