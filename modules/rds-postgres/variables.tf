variable "db_name" {
#	default = string
}
variable "db_user" {
#	default = string
}
variable "db_password" {
#	default = string
}
#variable "db_subnet_group" {}
variable "db_subnet_group_name" {
#	default = string
}
variable "private_subnet_id" {
	type        = list(string)
}

variable "vpc_id" {}
