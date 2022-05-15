# Create my VPC
resource "aws_vpc" "theVPC" {
  cidr_block = var.vpc_CIDR
  
  tags = {
	Name = "${var.prefux}VPC"
  }
}