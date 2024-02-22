terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.37.0"
    }
  }
}

provider "aws" {
  region = "br-sa-east-1"
}

module "vpc" {
  source = "./modules/vpc"
}