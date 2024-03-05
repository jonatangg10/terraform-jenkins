terraform {
  required_providers {
    aws = {
        source = "hashicorp/aws"
        version = ">=5.35.0, <5.37.0, !=5.35.0"
    }
  }
  required_version = "~>1.7.0"
}
provider "aws" {
  region = "us-east-1"
  default_tags {
    tags = var.tags
  }
}