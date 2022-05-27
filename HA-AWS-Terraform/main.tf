terraform {
	required_providers {
		aws = {
			source  = "hashicorp/aws"
			version = "~> 3.27"
		}
	}
	required_version = ">= 0.14.9"
}

# Configure the AWS Provider
provider "aws" {
	region = var.aws_region
}

# Creates the link with the modules
module "VPC" {
	source             = "./modules/vpc_module"
	base_cidr_block    = "10.0.0.0/16"
	availability_zones = ["us-west-2a", "us-west-2b", "us-west-2c"]
}

module "secGroup" {
	source = "./modules/sg_module"
	name   = "mySG"
	port   = 8080
	vpc_id = module.VPC.vpc_id
}

module "AG" {
	source               = "./modules/ag_module"
	name                 = "myAG"
	max_size             = 2
	min_size             = 1
	desired_capacity     = 2
	launch_configuration = module.LC.LC_name
	subnets	             = module.VPC.privateSubnets
}

module "LC" {
	source        = "./modules/lc_module"
	name          = "myLC"
	instance_type = "t2.micro"
}