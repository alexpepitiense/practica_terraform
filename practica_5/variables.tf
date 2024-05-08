# si yo dejase el valor vacio, borrando la linea entera, me pedirian por entrada de teclado el valor a poner
# tambien puedo mediante variables de entorno poniendo TF_VAR_nombreVariable. export TF_VAR_virginia_cidr ="10.10.0.0/16"
# para ver las variables de terraform: env | grep TF
# para borrarlo, unset TF_VAR_virginia_cidr
variable "virginia_cidr" {

}

variable "ohio_cidr" {

}
