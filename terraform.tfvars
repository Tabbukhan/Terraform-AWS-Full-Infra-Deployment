# S3 Variables
bucket_name          = "my-terraform-s3-bucket"

# EC2 Variables
instance_name       = "private-ec2"
ami_id              = "ami-0f918f7e67a3323f0"
instance_type       = "t3.micro"
my_ip               = "0.0.0.0/0"  # "13.234.231.39/32"
key_name            = "private-instance-key"

# RDS Variables
db_name              = "mydb"
db_user              = "tashue"
db_password          = "StrongPass123!"
#db_sg                = "sg-db123456"
db_subnet_group_name = "my-db-subnet-group"

# DocumentDB variables
docdb_master_username = "docdbadmin"
docdb_master_password = "DocdbPass123!"

# AWS Connect variables
#connect_alias       = "my-connect-instance"

# VPC Variables
vpc_cidr             = "10.0.0.0/16"
vpc_name             = "demo-vpc"
public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet_cidrs = ["10.0.11.0/24", "10.0.12.0/24"]
availability_zones   = ["ap-south-1a", "ap-south-1b"]

