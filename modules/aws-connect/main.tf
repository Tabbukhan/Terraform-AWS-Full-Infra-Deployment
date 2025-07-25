resource "aws_connect_instance" "this" {
  identity_management_type = "SAML"
  instance_alias           = var.alias
}
