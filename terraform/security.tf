resource "aws_security_group" "instance_sg" {
  for_each = var.ec2-instances

  name        = "${each.key}-sg"
  description = "Security Group for ${each.key}"

  dynamic "ingress" {
    for_each = each.value.sgs

    content {
      from_port   = ingress.value.port
      to_port     = ingress.value.port
      protocol    = "tcp"
      cidr_blocks = ingress.value.sources
      description = "Allow inbound traffic on port ${ingress.value.port}"
    }
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = each.value.tags
}
