# Instalación de Terraform

Este documento proporciona las instrucciones necesarias para instalar Terraform en sistemas basados en Debian o Ubuntu utilizando `apt`.

## Requisitos previos

Antes de comenzar, asegúrate de tener permisos de administrador (sudo) en el sistema.

## Pasos para la instalación

1. **Agregar la clave GPG del repositorio de HashiCorp**:

   Este paso agrega la clave de firma oficial de HashiCorp al sistema para asegurar la autenticidad de los paquetes descargados.

   ```bash
   wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
