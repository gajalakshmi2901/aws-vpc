terraform {
    required_version = ">= 1.6.1"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.15"
    }
  }
}
provider "aws" {

  access_key=var.access_key
  secret_key =var.secret_key
}