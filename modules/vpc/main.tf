resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr_block

  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "main-igw" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = var.rt_cidr_block
    gateway_id = aws_internet_gateway.main-igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

data "aws_availability_zones" "available" {}

resource "aws_subnet" "public_subnets" {
  count = length(var.subnet_cidr_blocks)

  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet_cidr_blocks[count.index]
  availability_zone = data.aws_availability_zones.available.names[count.index]

  tags = {
    Name = "public_subnet_${count.index}"
  }
}

resource "aws_route_table_association" "rt_association" {
  count = length(var.subnet_cidr_blocks)
  subnet_id = aws_subnet.public_subnets[count.index].id
  route_table_id = aws_route_table.public_rt.id
}