# EC2
output "ec2_instance_id" {
  value = module.ec2_private.private_instance_id
}


# S3
output "s3_bucket_name" {
  value = module.s3.bucket_name
}

# RDS
output "rds_endpoint" {
  value = module.rds.db_endpoint
}

# DocumentDB
output "documentdb_cluster_endpoint" {
  value = module.documentdb.cluster_endpoint
}

# AWS Connect
#output "connect_instance_alias" {
#  value = module.connect.instance_alias
#}

# AWS VPC
output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}
