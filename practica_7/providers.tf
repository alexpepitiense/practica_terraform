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
  default_tags {
    tags = var.tags
  }
}
