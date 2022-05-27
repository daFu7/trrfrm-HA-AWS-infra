# SecurityGroup Module Resources

resource "aws_security_group" "allow_tls" {
	name = var.name
	vpc_id = var.vpc_id
	
	ingress {
		description = "TLS from VPC"
		from_port   = var.port
		to_port     = var.port
		protocol    = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
	
	egress {
		from_port   = 0
		to_port     = 0
		protocol    = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
}