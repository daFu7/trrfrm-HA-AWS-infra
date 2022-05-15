variable "prefux" {
	type = string
	default = "my_Fu_"
}

variable "vpc_CIDR" {
	type = string
	default = "10.0.0.0/16"
}

variable "publicSubnet1_CIDR" {
	type = string
	default = "10.0.1.0/24"
}

variable "publicSubnet2_CIDR" {
	type = string
	default = "10.0.2.0/24"
}

variable "publicSubnet3_CIDR" {
	type = string
	default = "10.0.3.0/24"
}

variable "privateSubnet1_CIDR" {
	type = string
	default = "10.0.4.0/24"
}

variable "privateSubnet2_CIDR" {
	type = string
	default = "10.0.5.0/24"
}

variable "privateSubnet3_CIDR" {
	type = string
	default = "10.0.6.0/24"
}

