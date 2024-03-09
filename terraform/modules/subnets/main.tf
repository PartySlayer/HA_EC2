data "aws_availability_zones" "available" {}

resource "aws_subnet" "public_subnets" {
  count = length(var.subnet_cidr_blocks)

  vpc_id            = var.vpc.vpc_id
  cidr_block        = var.subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "public_subnet_${count.index}"
  }
}
