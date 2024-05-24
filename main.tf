terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
  cloud {
    organization = "hugodiniz"
    workspaces {
      name = "glasslenses-server"
    }
  }
}

provider "aws" {
  region     = "sa-east-1"
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source                 = "./modules/iam"
  pipeline_user_username = "glasslenses_github_actions"
}

module "lambda_request_handler" {
  source               = "./modules/lambda"
  lambda_function_name = "browser_request_handler"
  lambda_role_arn      = module.iam.lambda_role_arn
}

module "database" {
  source = "./modules/database"
  primary_key = {
    "name" : "company_name",
    "type" : "S"
  }
  /*columns = [
    {
      "name": "rating",
      "type": "N"
    }
  ]*/ //No need to set columns in non-relational databases unless required for further database configurations like indexing
  ttl_field_name = "TTL"
  enable_ttl = true
}