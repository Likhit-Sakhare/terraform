provider "aws" {
    region = var.region
}

module "vpc" {
    source = "./modules/vpc"

    project = "likhit-module"
    vpc_cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    vpc_pub_subnet_cidr_block = "10.0.1.0/24"
    vpc_pri_subnet_cidr_block = "10.0.2.0/24"
}

module "instance" {
    source = "./modules/instance"

    project = "likhit-module"
    ami = "ami-0fa91bc90632c73c9"
    instance_type = "t3.micro"
}