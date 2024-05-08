output "ec2_public_ip" {
  description = "IP publica de la instancia"
  # imprimir IP en pantalla
  value = aws_instance.public_instance.public_ip
}
