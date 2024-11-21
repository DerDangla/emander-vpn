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
  region  = "ca-central-1"
  profile = "source"

  assume_role {
    role_arn = "arn:aws:iam::730335337132:role/vpn-edangla-role"
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDhHTVSqc9M6zBHlGiTPnTpPxUcL+hFoaJLqiKTR+j5V0f7WSseDi0WPjHMLU0LYMO+drN7iqQFWW6UNu59NdzA+v+AGl2E0a1lGJHQ08TFqZSGwIdK3WfvAqUz3gZeNPwgOC3NNzZ2SxJSXnAVt3Ne7p/yXoXZVzSICQzngZJ5tuHGrPdVyiqRWOswqsMqHVmQUq0feUrGoYUgAkNY7nK1mXaUxAnoc6QiGrofQAzMgsB5MENog56sQe+YfmuI475BQXIc7ZjopIDedtJXliybFU2l70ekVVNQ3Hy0eWEQaThmofjz+Jn1GLJrXFBCJJ829ogv8s9MIbAR0qYHesOX emanderdangla@Emanders-Laptop.local"
}

resource "aws_instance" "emander-instance" {
  ami           = "ami-0d13170a36bc1b384"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.deployer.key_name

  vpc_security_group_ids = [aws_security_group.emander_sg.id]

  tags = {
    Name = var.instance_name
  }
}

