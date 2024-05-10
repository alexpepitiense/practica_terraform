resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  # Si uso workspaces
  # cidr_block = lookup(var.virginia_cidr, terraform.workspace)
  tags = {
    "Name" = "vpc_virginia-${local.sufix}"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  #cidr_block = var.public_subnet
  cidr_block = var.subnets[0]
  # para que este resource sea public subnet hay que activar esto
  map_public_ip_on_launch = true
  tags = {
    "Name" = "public_subnet-${local.sufix}"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  #cidr_block = var.private_subnet
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "private_subnet-${local.sufix}"
  }
  depends_on = [
    aws_subnet.public_subnet
  ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "igw_vpc_virginia-${local.sufix}"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc_virginia.id

  route {
    # para que pueda salir a cualquier destino
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "public_custom_rt-${local.sufix}"
  }
}
# ahora hay que asociar la tabla con la subnet
resource "aws_route_table_association" "rta_public_subnet" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}

resource "aws_security_group" "sg_public_instance" {
  name        = "Public Instance SG"
  description = "Allow SSH inbound traffic and all egress traffic"
  vpc_id      = aws_vpc.vpc_virginia.id

  # con esto junto las 3 ingress rules
  dynamic "ingress" {
    for_each = var.ingress_ports_list
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = [var.sg_ingress_cidr]
    }

  }
  tags = {
    Name = "Public Instance SG-${local.sufix}"
  }
}

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_ssh" {
#   security_group_id = aws_security_group.sg_public_instance.id
#   cidr_ipv4         = var.sg_ingress_cidr
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
#   description       = "Ingress rule for ssh inbound traffic"
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_http" {
#   security_group_id = aws_security_group.sg_public_instance.id
#   cidr_ipv4         = var.sg_ingress_cidr
#   from_port         = 80
#   ip_protocol       = "tcp"
#   to_port           = 80
#   description       = "Ingress rule for http inbound traffic"
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_https" {
#   security_group_id = aws_security_group.sg_public_instance.id
#   cidr_ipv4         = var.sg_ingress_cidr
#   from_port         = 443
#   ip_protocol       = "tcp"
#   to_port           = 443
#   description       = "Ingress rule for https inbound traffic"
# }

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg_public_instance.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  description       = "Egress rule for all traffic"
}

module "mybucket" {
  source      = "./modules/s3"
  bucket_name = "nombreunico123456"
}

output "s3_arn" {
  value = module.mybucket.s3_bucket_arn
}

# module "terraform_state_backend" {
#   source = "cloudposse/tfstate-backend/aws"
#   # Cloud Posse recommends pinning every module to a specific version
#   # version     = "x.x.x"
#   version                            = "0.38.1"
#   namespace                          = "example"
#   stage                              = "prod"
#   name                               = "terraform"
#   environment                        = "us-east-1"
#   attributes                         = ["state"]
#   s3_bucket_name                     = "argonz-us-east-1-prod-terraform-state"
#   terraform_backend_config_file_path = "."
#   terraform_backend_config_file_name = "backend.tf"
#   force_destroy                      = false
# }
