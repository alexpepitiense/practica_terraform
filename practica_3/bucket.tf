resource "aws_s3_bucket" "proveedores" {
  count  = 2
  bucket = "proveedores-${random_string.sufijo[count.index].id}"
  tags = {
    Owner       = "argonz"
    Environment = "Dev"
    Office      = "proveedores"
  }
}

resource "random_string" "sufijo" {
  count   = 2
  length  = 8
  special = false
  upper   = false
  numeric = false
  lower   = true
}
#terraform can build up to 10 resources in paralel
