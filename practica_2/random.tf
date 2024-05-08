# si yo quiero crear 4 local files random, tengo que crear 4 sufijos tambien. O puedo usar el parametro count. DRY
resource "random_string" "sufijo" {
  count   = 3
  length  = 4
  special = false
  upper   = false
  numeric = false
  lower   = true
  # override_special = "/@£$"
}

