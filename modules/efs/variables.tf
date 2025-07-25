variable "efs_name" {
  description = "Name for the EFS file system"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID where EFS will be deployed"
  type        = string
}

variable "private_subnet_ids" {
  description = "Subnets to create mount targets in"
  type        = list(string)
}
variable "allowed_cidr_blocks" {
  description = "CIDR blocks allowed to access EFS (e.g. private VPC CIDR)"
  type        = list(string)
}

#variable "ec2_sg_id" {
#  type        = string
#  description = "Security group ID of EC2 instances that access EFS"
#}

variable "sg_name" {
  description = "Security group name"
  type        = string
  default     = "efs-sg"
}
