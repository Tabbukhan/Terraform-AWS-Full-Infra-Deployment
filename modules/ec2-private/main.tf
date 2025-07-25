resource "aws_security_group" "sg" {
  name        = "${var.instance_name}-sg"
  vpc_id      = var.vpc_id
  description = "Security group for EC2 instance"

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip]  # Replace with your actual IP if needed
  }
  tags = {
    Name = "${var.instance_name}-ec2-private"
  }
}


resource "aws_instance" "private_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.private_subnet_id  # element(var.private_subnet_id, 0)
  vpc_security_group_ids = [aws_security_group.sg.id]
  key_name               = var.key_name
  iam_instance_profile = var.iam_instance_profile
  tags = {
    Name = var.instance_name
    "SSM Managed" = "true"
	}
}

