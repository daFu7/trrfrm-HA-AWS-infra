# Create my Route Tables
resource "aws_route_table" "Public_RT" {
  vpc_id = aws_vpc.theVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.GW.id
  }

  tags = {
    Name = "${var.prefux}PublicRT"
  }
}

resource "aws_route_table" "Private_RT" {
  vpc_id = aws_vpc.theVPC.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.natGW1.id
  }

  tags = {
    Name = "${var.prefux}PrivateRT"
  }
}