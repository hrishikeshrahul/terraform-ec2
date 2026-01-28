resource "aws_vpc" "Hrishi-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Hrishi-vpc"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.Hrishi-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.Hrishi-vpc.id
  cidr_block = "10.0.0.0/26"
  availability_zone = "us-east-1b"

  tags = {
    Name = "private_subnet"
  }
}

resource "aws_internet_gateway" "Hrishi" {
  vpc_id = aws_vpc.Hrishi-vpc.id

  tags = {
    Name = "Hrishi"
  }
}

resource "aws_route_table" "proute" {
  vpc_id = aws_vpc.Hrishi-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.Hrishi.id
    
  }

  tags = {
    Name = "publicroute"
  }
}

resource "aws_route_table_association" "public_association" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.proute.id
}

resource "aws_route_table" "prroute" {
  vpc_id = aws_vpc.Hrishi-vpc.id

  tags = {
    Name = "prroute"
  }
}

resource "aws_route_table_association" "private_association" {
  subnet_id      = aws_subnet.private_subnet.id
  route_table_id = aws_route_table.prroute.id
}