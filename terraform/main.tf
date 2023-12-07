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
  region = "us-east-1"
  profile = var.aws_profile
}

provider "aws" {
  alias = "eu"
  region = "eu-central-1"
  profile = var.aws_profile
}
