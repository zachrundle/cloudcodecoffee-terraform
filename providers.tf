terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region              = var.region
  allowed_account_ids = [var.aws_account]

  assume_role {
    role_arn     = "arn:aws:iam::${var.aws_account}:role/svc_terraform"
    session_name = "Terraform"
  }

  default_tags {
    tags = {
      managed_by = "terraform"
      workspace  = terraform.workspace
    }
  }
}