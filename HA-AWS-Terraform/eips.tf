#Create the EIP for the NAT Gateways
resource "aws_eip" "eip_NAT1" {
  depends_on = [aws_internet_gateway.GW]
  
}

