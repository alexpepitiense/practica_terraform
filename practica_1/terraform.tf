resource "local_file" "productos" {
  content  = "Lista de productos para el siguiente mes"
  filename = "productos.txt"
}
