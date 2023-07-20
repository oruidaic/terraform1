provider "aws" {
  region = "ap-northeast-1"
}

terraform {
  required_version = "~> 1.0.10"
  backend "s3" {
    # your own s3 bucket
    bucket = "data-lake-fsi-demo"
    region = "ap-northeast-1"
    key    = "terraform.tfstate"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

resource "aws_vpc" "main" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    Name = "created-by-terraform"
  }
}


