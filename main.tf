terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

provider "aws" {
  region = "sa-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}

module "iam" {
  source = "./modules/iam"
}

module "lambda_request_handler" {
  source = "./modules/lambda"
  lambda_function_name = "browser_request_handler"
  lambda_role_arn = module.iam.lambda_role_arn
}