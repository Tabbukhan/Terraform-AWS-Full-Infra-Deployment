provider "aws" {
  region = "ap-south-1"
}

# ----------------------
# EC2 (Private Instance)
# ----------------------
variable "instance_name" {
  type        = string
  description = "Name tag for the EC2 instance"
}

variable "ami_id" {
  type        = string
  description = "AMI ID to use for the EC2 instance"
}

variable "instance_type" {
  type        = string
  description = "Type of EC2 instance (e.g., t2.micro)"
}

variable "my_ip" {
  type        = string
  description = "Your IP address to allow SSH access (e.g., x.x.x.x/32)"
}

variable "key_name" {
  type        = string
  description = "Name of the EC2 Key Pair for SSH access"
}

# ----------------------
# S3 Bucket
# ----------------------
variable "bucket_name" {
  type        = string
  description = "Name of the S3 bucket"
}

# ----------------------
# RDS PostgreSQL
# ----------------------
variable "db_name" {
  type        = string
  description = "Database name for PostgreSQL"
}

variable "db_user" {
  type        = string
  description = "Username for RDS PostgreSQL"
}

variable "db_password" {
  type        = string
  description = "Password for RDS PostgreSQL"
}

variable "db_subnet_group_name" {
  type        = string
  description = "Subnet group name for RDS"
}

# ----------------------
# DocumentDB
# ----------------------
variable "docdb_master_username" {
  type        = string
  description = "Master username for DocumentDB"
}

variable "docdb_master_password" {
  type        = string
  description = "Master password for DocumentDB"
}

# ----------------------
# VPC and Networking
# ----------------------
variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name tag for the VPC"
}

variable "public_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for public subnets"
}

variable "private_subnet_cidrs" {
  type        = list(string)
  description = "List of CIDR blocks for private subnets"
}

variable "availability_zones" {
  type        = list(string)
  description = "List of availability zones to use"
}
