resource "aws_docdb_cluster" "this" {
  cluster_identifier = "docdb-cluster"
  master_username    = var.master_username
  master_password    = var.master_password
}

resource "aws_docdb_cluster_instance" "this" {
  count              = 1
  identifier         = "docdb-instance-${count.index}"
  cluster_identifier = aws_docdb_cluster.this.id
  instance_class     = "db.t3.medium"
}
