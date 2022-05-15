# Create my Internet Gateway
resource "aws_internet_gateway" "GW" {
  vpc_id = aws_vpc.theVPC.id

  tags = {
    Name = "${var.prefux}GW"
  }
}