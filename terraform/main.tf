terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  alias = "us"
  region = local.aws_us_region
  profile = var.aws_profile
}

provider "aws" {
  alias = "eu"
  region = local.aws_eu_region
  profile = var.aws_profile
}
