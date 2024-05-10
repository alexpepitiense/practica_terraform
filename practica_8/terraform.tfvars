virginia_cidr = "10.10.0.0/16"
# public_subnet  = "10.10.0.0/24"
# private_subnet = "10.10.1.0/24"

# Si uso workspace
# virginia_cidr = {
#   "prod" = "10.10.0.0/16"
#   "dev"  = "172.16.0.0/16"
# }

subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
  "env"     = "dev"
  "owner"   = "argonz"
  "cloud"   = "aws"
  "IAC"     = "Terraform"
  "project" = "cerberus"
  "region"  = "virginia"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_specs = {
  "ami"           = "ami-0a1179631ec8933d7"
  "instance_type" = "t2.micro"
}

# dependiendo del valor, me levanta o no la instancia
enable_monitoring = 0

ingress_ports_list = [22, 80, 443]
