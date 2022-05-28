# Autoscaling Group Module Variables

# variable "name" {}

variable "max_size" {
	type = number
}
                
variable "min_size" {
	type = number
}

variable "desired_capacity" {
	type = number
}

variable "launch_configuration" {}

variable "subnets" {
	type = list(any)
}