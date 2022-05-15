# Create my 3 Public Subnets
resource "aws_subnet" "PublicSubnet1" {
  vpc_id     = aws_vpc.theVPC.id
  cidr_block = var.publicSubnet1_CIDR
  availability_zone = "us-west-2a"
  
  tags = {
    Name = "${var.prefux}PublicSubnet1"
  }
}

resource "aws_subnet" "PublicSubnet2" {
  vpc_id     = aws_vpc.theVPC.id
  cidr_block = var.publicSubnet2_CIDR
  availability_zone = "us-west-2b"

  tags = {
    Name = "${var.prefux}PublicSubnet2"
  }
}

resource "aws_subnet" "PublicSubnet3" {
  vpc_id     = aws_vpc.theVPC.id
  cidr_block = var.publicSubnet3_CIDR
  availability_zone = "us-west-2c"
  
  tags = {
    Name = "${var.prefux}PublicSubnet3"
  }
}

# Create my 3 Private Subnets
resource "aws_subnet" "PrivateSubnet1" {
  vpc_id     = aws_vpc.theVPC.id
  cidr_block = var.privateSubnet1_CIDR
  availability_zone = "us-west-2a"

  tags = {
    Name = "${var.prefux}PrivateSubnet1"
  }
}

resource "aws_subnet" "PrivateSubnet2" {
  vpc_id     = aws_vpc.theVPC.id
  cidr_block = var.privateSubnet2_CIDR
  availability_zone = "us-west-2b"

  tags = {
    Name = "${var.prefux}PrivateSubnet2"
  }
}

resource "aws_subnet" "PrivateSubnet3" {
  vpc_id     = aws_vpc.theVPC.id
  cidr_block = var.privateSubnet3_CIDR
  availability_zone = "us-west-2c"

  tags = {
    Name = "${var.prefux}PrivateSubnet3"
  }
}