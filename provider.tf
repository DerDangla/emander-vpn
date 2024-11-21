terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }

  backend "s3" {
    bucket         = "emander-vpn-tf-state"
    key            = "terraform.tfstate"
    region         = "ca-central-1"
    encrypt        = true
    dynamodb_table = "emander-vpn-tf-state-lock"
  }
}

provider "aws" {
  region = "ca-central-1"
  alias  = "ca-central-1"
}
