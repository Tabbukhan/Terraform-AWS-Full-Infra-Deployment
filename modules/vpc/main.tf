resource "aws_vpc" "my_vpc"{
        cidr_block = var.vpc_cidr     #"10.0.0.0/16"
        enable_dns_support = true
        enable_dns_hostnames = true

        tags = {
          Name = var.vpc_name
        }
}

resource "aws_subnet" "public" {
        count = length(var.public_subnet_cidrs)
        vpc_id = aws_vpc.my_vpc.id
        cidr_block = var.public_subnet_cidrs[count.index] # "10.0.0.0/19"
        availability_zone = element(var.availability_zones, count.index)  # "ap-south-1a"
        map_public_ip_on_launch = true

        tags = {
          Name = "${var.vpc_name}-public-${count.index + 1}"
        }
}
# "10.0.32.0/19
resource "aws_subnet" "private" {
        count = length(var.private_subnet_cidrs)
        vpc_id = aws_vpc.my_vpc.id
        cidr_block = var.private_subnet_cidrs[count.index] # "10.0.64.0/19"
        availability_zone = element(var.availability_zones, count.index)   # "ap-south-1a"

        tags = {
          Name = "${var.vpc_name}-private-${count.index + 1}"
        }
}

resource "aws_internet_gateway" "igw" {
        vpc_id = aws_vpc.my_vpc.id

        tags = {
          Name = "${var.vpc_name}-igw"
        }
}

resource "aws_eip" "eip" {
        count = 1
        domain = "vpc"

        tags = {
          Name = "${var.vpc_name}-eip"
        }
}


resource "aws_route_table" "public" {
        vpc_id = aws_vpc.my_vpc.id

        route {
          cidr_block = "0.0.0.0/0"
          gateway_id = aws_internet_gateway.igw.id
        }

        tags = {
          Name = "${var.vpc_name}-public-rt"
        }
}

resource "aws_route_table_association" "public_z1"{
        count = length(var.public_subnet_cidrs)
        subnet_id = aws_subnet.public[count.index].id
        route_table_id = aws_route_table.public.id
}

resource "aws_nat_gateway" "nat"{
        allocation_id = aws_eip.eip[0].id
        subnet_id = aws_subnet.public[0].id

        tags = {
          Name = "${var.vpc_name}-nat"
        }

#       depends_on = [aws_internet_gateway.igw]
}

resource "aws_route_table" "private" {
        vpc_id = aws_vpc.my_vpc.id
        
        route {
          cidr_block = "0.0.0.0/0"
          gateway_id = aws_nat_gateway.nat.id
        }

        tags = {
          Name = "${var.vpc_name}-private-rt"
        }
}

resource "aws_route_table_association" "private"{
        count = length(var.private_subnet_cidrs)
        subnet_id = aws_subnet.private[count.index].id
        route_table_id = aws_route_table.private.id
}
