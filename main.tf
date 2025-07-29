# provider "aws" {
#   region = "ap-south-1"
#   alias  = "ap_south_1"
#}

# S3 Module
module "s3" {
  source      = "./modules/s3"
  bucket_name = var.bucket_name
}

# AWS EFS Module
module "efs" {
  source            = "./modules/efs"
  efs_name          = "my-app-efs-demo"
  private_subnet_ids = module.vpc.private_subnet_ids
  allowed_cidr_blocks = [module.vpc.vpc_cidr]
  vpc_id            = module.vpc.vpc_id
#  security_group_id = aws_security_group.efs_sg.id
}


# VPC module
module "vpc" {
  source               = "./modules/vpc"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  availability_zones   = var.availability_zones
}

# RDS PostgreSQL Module
module "rds" {
  source           = "./modules/rds-postgres"
  db_name          = var.db_name
  db_user          = var.db_user
  db_password      = var.db_password
  #db_sg            = var.db_sg
  db_subnet_group_name  = var.db_subnet_group_name
  private_subnet_id = module.vpc.private_subnet_ids
  vpc_id           = module.vpc.vpc_id
}

# DocumentDB Module
module "documentdb" {
  source           = "./modules/documentdb"
  master_username  = var.docdb_master_username
  master_password  = var.docdb_master_password
}

# AWS Connect Module
#module "connect" {
#  source = "./modules/aws-connect"
#  alias  = var.connect_alias
#}

# SSM Module
module "ssm" {
  source    = "./modules/ssm"
  role_name = "ssm-ec2-role-demo"
}


# EC2 Private Module
module "ec2_private" {
  source            = "./modules/ec2-private"
  ami_id            = var.ami_id
  instance_type     = var.instance_type
  private_subnet_id = module.vpc.private_subnet_ids[0] # use first private subnet
  instance_name     = var.instance_name
  key_name	    = var.key_name
  my_ip             = var.my_ip  
  vpc_id            = module.vpc.vpc_id
  iam_instance_profile = module.ssm.instance_profile_name
}
