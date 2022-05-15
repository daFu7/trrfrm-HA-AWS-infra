# Create the Route Table Public Subnets association
resource "aws_route_table_association" "PublicAs1" {
  subnet_id      = aws_subnet.PublicSubnet1.id
  route_table_id = aws_route_table.Public_RT.id
}

resource "aws_route_table_association" "PublicAs2" {
  subnet_id      = aws_subnet.PublicSubnet2.id
  route_table_id = aws_route_table.Public_RT.id
}

resource "aws_route_table_association" "PublicAs3" {
  subnet_id      = aws_subnet.PublicSubnet3.id
  route_table_id = aws_route_table.Public_RT.id
}

# Create the Route Table Private Subnets association
resource "aws_route_table_association" "PrivateAs1" {
  subnet_id      = aws_subnet.PrivateSubnet1.id
  route_table_id = aws_route_table.Private_RT.id
}

resource "aws_route_table_association" "PrivateAs2" {
  subnet_id      = aws_subnet.PrivateSubnet2.id
  route_table_id = aws_route_table.Private_RT.id
}

resource "aws_route_table_association" "PrivateAs3" {
  subnet_id      = aws_subnet.PrivateSubnet3.id
  route_table_id = aws_route_table.Private_RT.id
}
