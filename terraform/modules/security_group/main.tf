resource "aws_security_group" "main" {
  name        = var.security_group_name
  vpc_id      = module.vpc.vpc_id

  dynamic "ingress" {
    for_each = var.security_group_ingress_rules

    content {
      description      = ingress.value.description
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
    }
  }

   egress {
    description      = "Allow outgoing traffic"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
 }

  tags = {
    Name = var.security_group_name
  }
}
