resource "random_id" "suffix" {
	byte_length = 4
}

resource "aws_s3_bucket" "this" {
  bucket = "${var.bucket_name}-${random_id.suffix.hex}"
  force_destroy = true
  tags = {
    Name = "${var.bucket_name}-${random_id.suffix.hex}"
  }
 # provider = aws.ap_south_1  # <-- Use named provider
}
