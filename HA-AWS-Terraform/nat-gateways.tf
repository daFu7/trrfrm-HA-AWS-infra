# Create my NAT Gateways
resource "aws_nat_gateway" "natGW1" {
  allocation_id = aws_eip.eip_NAT1.id
  subnet_id     = aws_subnet.PublicSubnet1.id

  tags = {
    Name = "${var.prefux}NAT_1"
  }

}