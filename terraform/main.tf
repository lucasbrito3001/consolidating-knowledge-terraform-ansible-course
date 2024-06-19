terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws",
      version = "5.54.1"
    }
  }

#   backend "s3" {
#     bucket = "learning-tf-ansible-backend"
#     region = "us-west-2"
#   }
}

provider "aws" {
  region = "us-west-2"
}
