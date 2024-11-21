terraform {
  backend "remote" {
    hostname     = "app.terraform.io"
    organization = "emander-org"
    workspaces {
      name = "emander-vpn"
    }
  }
}

provider "aws" {
  region  = "ca-central-1"
  profile = "source"

  assume_role {
    role_arn = "<ROLE_ARN>"
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

