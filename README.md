# Instalación de Terraform

Este documento proporciona las instrucciones necesarias para instalar Terraform en sistemas basados en Debian o Ubuntu utilizando `apt`.

## Requisitos previos

Antes de comenzar, asegúrate de tener permisos de administrador (sudo) en el sistema.

## Pasos para la instalación

1. **Agregar la clave GPG del repositorio de HashiCorp**:

   Este paso agrega la clave de firma oficial de HashiCorp al sistema para asegurar la autenticidad de los paquetes descargados.

   ```bash
   wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

2. **Agregar el repositorio de HashiCorp**
   ```bash
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

3. **Actualizar la lista de paquetes y instalar Terraform**
   ```bash
   sudo apt update && sudo apt install terraform

4. **Verificar la instalación**
   ```bash
   terraform --version

5. **Ubicación del binario de Terraform**
   ```bash
   whereis terraform
