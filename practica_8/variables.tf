# si yo dejase el valor vacio, borrando la linea entera, me pedirian por entrada de teclado el valor a poner
# tambien puedo mediante variables de entorno poniendo TF_VAR_nombreVariable. export TF_VAR_virginia_cidr ="10.10.0.0/16"
# para ver las variables de terraform: env | grep TF
# para borrarlo, unset TF_VAR_virginia_cidr
variable "virginia_cidr" {
  description = "CIDR Virginia"
  type        = string
  # sensitive es para tapar el valor en el terraform plan y show
  #sensitive   = true
}

# variable "public_subnet" {
#   description = "CIDR public subnet"
#   type        = string

# }

# variable "private_subnet" {
#   description = "CIDR private subnet"
#   type        = string
# }

variable "subnets" {
  description = "Lista de subnets"
  type        = list(string)
}

variable "tags" {
  description = "tags del proyecto"
  type        = map(string)
}

variable "sg_ingress_cidr" {
  description = "CIDR for ingress traffic"
  type        = string
}

variable "ec2_specs" {
  description = "Parametros de la instancia"
  type        = map(string)
}

variable "enable_monitoring" {
  description = "Habilita el despliegue de un servidor de monitoreo"
  type        = number
}

variable "ingress_ports_list" {
  description = "Lista de puertos de ingress"
  type        = list(number)
}
