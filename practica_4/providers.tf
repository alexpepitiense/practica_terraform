terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=5.44.0, <5.48.0, !=5.45.0"
    }
  }
  #esto se supone que es como poner 1.8.x, como tengo la 1.8.2 pues funciona
  required_version = "~>1.8.0"
}

provider "aws" {
  region = "us-east-1"
}
# Y si quiero desplegar en otra region? Alias
provider "aws" {
  region = "us-east-2"
  alias  = "ohio"
}
# si hago ls -a se ve una carpeta terraform, que la puedo borrar para crearla de nuevo con el init
