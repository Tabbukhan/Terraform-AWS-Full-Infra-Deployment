provider "aws" {
	region = "ap-south-1"
}

# EC2 (Private)
variable "instance_name" {}
variable "ami_id" {}
variable "instance_type" {}
variable "my_ip" {}
variable "key_name" {}

# S3
variable "bucket_name" {}

# RDS PostgreSQL
variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
#variable "db_sg" {}
variable "db_subnet_group_name" {}

# DocumentDB
variable "docdb_master_username" {}
variable "docdb_master_password" {}

# AWS Connect
#variable "connect_alias" {}

# AWS VPC
variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnet_cidrs" {}
variable "private_subnet_cidrs" {}
variable "availability_zones" {}


