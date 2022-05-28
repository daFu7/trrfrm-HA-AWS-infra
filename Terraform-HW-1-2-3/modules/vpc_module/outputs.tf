# VPC Module Outputs

output "vpc_id" {
	value = aws_vpc.theVPC.id
}

output "privateSubnets" {
	value = aws_subnet.privateSubnet[*].id
}