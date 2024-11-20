resource "aws_security_group" "emander_sg" {
  name        = "emander_sg"
  description = "to allow ssh trafic"
  #   vpc_id      = "vpc-01a22ed41681c07c4"

  tags = {
    Name = "emander_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
  security_group_id = aws_security_group.emander_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  from_port   = 22
  ip_protocol = "tcp"
  to_port     = 22
}

resource "aws_vpc_security_group_egress_rule" "allow_all_ssh" {
  security_group_id = aws_security_group.emander_sg.id

  cidr_ipv4   = "0.0.0.0/0"
  ip_protocol = "-1" # semantically equivalent to all ports
}
