resource "aws_vpc" "main" {
  count                = var.create ? 1 : 0
  cidr_block          = var.vpc_cidr
  enable_dns_support  = true
  enable_dns_hostnames = true

  tags = {
    Name = "main-vpc"
  }
}

resource "aws_internet_gateway" "main" {
  count  = var.create ? 1 : 0
  vpc_id = aws_vpc.main[0].id

  tags = {
    Name = "main-igw"
  }
}

resource "aws_subnet" "public" {
  count                   = var.create ? 1 : 0
  vpc_id                  = aws_vpc.main[0].id
  cidr_block              = var.public_subnet_cidr
  map_public_ip_on_launch = true
  availability_zone       = data.aws_availability_zones.available.names[0]

  tags = {
    Name = "public-subnet"
  }
}

resource "aws_subnet" "private" {
  count             = var.create ? 1 : 0
  vpc_id            = aws_vpc.main[0].id
  cidr_block        = var.private_subnet_cidr
  availability_zone = data.aws_availability_zones.available.names[1]

  tags = {
    Name = "private-subnet"
  }
}

resource "aws_route_table" "public" {
  count  = var.create ? 1 : 0
  vpc_id = aws_vpc.main[0].id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main[0].id
  }

  tags = {
    Name = "public-route-table"
  }
}

resource "aws_route_table_association" "public" {
  count          = var.create ? 1 : 0
  subnet_id      = aws_subnet.public[0].id
  route_table_id = aws_route_table.public[0].id
}

resource "aws_route_table" "private" {
  count  = var.create ? 1 : 0
  vpc_id = aws_vpc.main[0].id

  tags = {
    Name = "private-route-table"
  }
}

resource "aws_route_table_association" "private" {
  count          = var.create ? 1 : 0
  subnet_id      = aws_subnet.private[0].id
  route_table_id = aws_route_table.private[0].id
}

data "aws_availability_zones" "available" {
  state = "available"
}
