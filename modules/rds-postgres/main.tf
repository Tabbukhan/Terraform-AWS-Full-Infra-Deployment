resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "Allow traffic to RDS"
  vpc_id      = var.vpc_id  # This must be passed from root

  ingress {
    from_port   = 5432
    to_port     = 5432
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # or private CIDRs if EC2 is in same VPC
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_db_subnet_group" "db_subnet_group" {
  name       = var.db_subnet_group_name
  subnet_ids = var.private_subnet_id

  tags = {
    Name = "rds-subnet-group"
  }
}


resource "aws_db_instance" "postgres" {
  identifier         = "postgres-db"
  engine             = "postgres"
  instance_class     = "db.t3.micro"
  allocated_storage  = 20
  db_name               = var.db_name
  username           = var.db_user
  password           = var.db_password
  skip_final_snapshot = true
#  vpc_security_group_ids = [var.db_sg]
#  db_subnet_group_name   = var.db_subnet_group
  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.rds_sg.id]
}
