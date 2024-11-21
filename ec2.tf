resource "aws_instance" "emander-instance" {
  ami           = "ami-0a14a0a5716389b2d"
  instance_type = "t2.micro"
  key_name      = aws_key_pair.emander-key.key_name

  vpc_security_group_ids = [aws_security_group.emander_sg.id]

  tags = {
    Name = var.instance_name
  }
}

resource "aws_key_pair" "emander-key" {
  key_name   = "emander-key"
  public_key = var.public_key
}
