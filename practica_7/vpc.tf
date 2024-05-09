resource "aws_vpc" "vpc_virginia" {
  cidr_block = var.virginia_cidr
  # Si uso workspaces
  # cidr_block = lookup(var.virginia_cidr, terraform.workspace)
  tags = {
    "Name" = "vpc_virginia"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  #cidr_block = var.public_subnet
  cidr_block = var.subnets[0]
  # para que este resource sea public subnet hay que activar esto
  map_public_ip_on_launch = true
  tags = {
    "Name" = "public_subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id = aws_vpc.vpc_virginia.id
  #cidr_block = var.private_subnet
  cidr_block = var.subnets[1]
  tags = {
    "Name" = "private_subnet"
  }
  depends_on = [
    aws_subnet.public_subnet
  ]
}

resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.vpc_virginia.id

  tags = {
    Name = "igw vpc virginia"
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
    Name = "public custom rt"
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

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.sg_public_instance.id
  cidr_ipv4         = var.sg_ingress_cidr
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
  description       = "Ingress rule for ssh inbound traffic"
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.sg_public_instance.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
  description       = "Egress rule for all traffic"
}
