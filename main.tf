terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

data "aws_caller_identity" "current" {}


data "aws_instance" "existing" {
  instance_id = "i-005fa65da34dd472c"
}


output "aws_account_id" {
  value = data.aws_caller_identity.current.account_id
}

output "aws_arn" {
  value = data.aws_caller_identity.current.arn
}

output "ec2_instance_id" {
  value = data.aws_instance.existing.id
}

output "ec2_instance_state" {
  value = data.aws_instance.existing.instance_state
}

output "ec2_instance_type" {
  value = data.aws_instance.existing.instance_type
}

resource "terraform_data" "app_config" {
  input = {
    name        = var.app_config.name
    port        = var.app_config.port
    environment = var.environment
    tags        = var.project_tags
  }
}

resource "terraform_data" "deployment" {
  input = "Deploy application configuration v2"

  depends_on = [
    terraform_data.app_config
  ]
}

module "app_config_demo" {
  source = "./modules/app-config"

  app_name    = "module-demo"
  app_port    = var.dev_app_port
  environment = "dev"
}
module "app_config_staging" {
  source = "./modules/app-config"

  app_name    = "staging-app"
  app_port    = var.staging_app_port
  environment = "staging"
}

resource "terraform_data" "count_demo" {
  count = 3

  input = {
    name = "app-${count.index + 1}"
  }
}

resource "terraform_data" "environment_demo" {
  for_each = {
    dev        = 8080
    staging    = 9090
    production = 3000
  }

  input = {
    environment = each.key
    port        = each.value
  }
}
module "network_demo" {
  source = "./modules/network"

  project_name = "week8-demo"
  vpc_cidr     = "10.20.0.0/16"
}
