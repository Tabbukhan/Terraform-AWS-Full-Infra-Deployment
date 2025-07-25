variable "instance_name" {
  description = "Name of the EC2 instance"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "private_subnet_id" {
  description = "Subnet ID where EC2 will be deployed"
  type        = string
}

variable "key_name" {
  description = "Name of the key pair for SSH access"
  type        = string
}

variable "my_ip" {
  description = "Your public IP to allow SSH access"
  type        = string
}

variable "vpc_id" {
  description = "VPC for sg"
  type        = string
}

variable "iam_instance_profile" {
  description = "IAM Instance Profile to attach to EC2"
  type        = string
  default     = null
}
