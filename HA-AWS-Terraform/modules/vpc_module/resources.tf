# VPC Module Resources

# Create my VPC
resource "aws_vpc" "theVPC" {
  cidr_block = var.base_cidr_block
  
  tags = {
	Name = "${var.prefux}VPC"
  }
}

# Create my Internet Gateway
resource "aws_internet_gateway" "GW" {
  vpc_id = aws_vpc.theVPC.id

  tags = {
    Name = "${var.prefux}GW"
  }
}

#Create the EIP for the NAT Gateways
resource "aws_eip" "eip_NAT" {
  depends_on = [aws_internet_gateway.GW]
}

# Create my NAT Gateways
resource "aws_nat_gateway" "natGW" {
  allocation_id = aws_eip.eip_NAT.id
  subnet_id     = element(aws_subnet.publicSubnet.*.id, 0)

  tags = {
    Name = "${var.prefux}NAT"
  }
}

# Create the public subnet
resource "aws_subnet" "publicSubnet" {
	# Creates one subnet for each given availability zone.
	count = length(var.availability_zones)
	# For each subnet, use one of the specified availability zones.
	availability_zone = var.availability_zones[count.index]
	
	vpc_id = aws_vpc.theVPC.id
	
	cidr_block = cidrsubnet(aws_vpc.theVPC.cidr_block, 4, count.index + 4)
	
	tags = {
		Name = "${var.prefux}publicSubnet${count.index}"
	}
}

# Create the private subnet
resource "aws_subnet" "privateSubnet" {
	# Creates one subnet for each given availability zone.
	count = length(var.availability_zones)
	# For each subnet, use one of the specified availability zones.
	availability_zone = var.availability_zones[count.index]
	
	vpc_id = aws_vpc.theVPC.id
	
	cidr_block = cidrsubnet(aws_vpc.theVPC.cidr_block, 4, count.index + 1)
	
	tags = {
		Name = "${var.prefux}privateSubnet${count.index}"
	}
}

# Create my public route table
resource "aws_route_table" "Public_RT" {
  vpc_id = aws_vpc.theVPC.id

  tags = {
    Name = "${var.prefux}PublicRT"
  }
}

# Create my private route table
resource "aws_route_table" "Private_RT" {
  vpc_id = aws_vpc.theVPC.id
  
  tags = {
    Name = "${var.prefux}PrivateRT"
  }
}

# Create the routes for the internet gateway
resource "aws_route" "publicIG" {
	route_table_id			= aws_route_table.Public_RT.id
	destination_cidr_block 	= "0.0.0.0/0"
	gateway_id				= aws_internet_gateway.GW.id
}

# Create the route for the NAT gateway
# resource "aws_route" "NATgw" {
#	route_table_id			= aws_route_table.Public_RT.id
#	destination_cidr_block 	= "0.0.0.0/0"
#	gateway_id				= aws_nat_gateway.natGW.id
# }

# Create the route table associations for public subnets
resource "aws_route_table_association" "PublicAso" {
	count 			= length(var.availability_zones)
	subnet_id      	= element(aws_subnet.publicSubnet.*.id, count.index)
	route_table_id 	= aws_route_table.Public_RT.id
}

# Create the route table associations for private subnets
resource "aws_route_table_association" "PrivateAso" {
	count			= length(var.availability_zones)
	subnet_id	    = element(aws_subnet.privateSubnet.*.id, count.index)
	route_table_id 	= aws_route_table.Private_RT.id
}