# Instalación de Terraform

Este documento proporciona las instrucciones necesarias para instalar Terraform en sistemas basados en Debian o Ubuntu utilizando `apt`.

## Requisitos previos

Antes de comenzar, asegúrate de tener permisos de administrador (sudo) en el sistema.

## Pasos para la instalación

1. **Agregar la clave GPG del repositorio de HashiCorp**:

   Este paso agrega la clave de firma oficial de HashiCorp al sistema para asegurar la autenticidad de los paquetes descargados.

   ```bash
   wget -O- https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg

2. **Agregar el repositorio de HashiCorp**:
   
   ```bash
   echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list

3. **Actualizar la lista de paquetes y instalar Terraform**:
   
   ```bash
   sudo apt update && sudo apt install terraform

4. **Verificar la instalación**:
   
   ```bash
   terraform --version

5. **Ubicación del binario de Terraform**:
   
   ```bash
   whereis terraform


# Instalación de AWS CLI Versión 2

Este documento proporciona instrucciones para instalar AWS CLI versión 2 en sistemas Linux. AWS CLI es la herramienta de línea de comandos de Amazon Web Services que permite administrar los servicios de AWS.

## Requisitos previos

Antes de comenzar con la instalación, necesitarás lo siguiente:
- Acceso a una terminal en tu sistema Linux.
- Permisos de administrador (sudo) para poder instalar paquetes.
- `curl` y `unzip` instalados en tu sistema para descargar y extraer archivos.

## Pasos para la instalación

1. **Descargar el paquete de AWS CLI v2**:

   Utiliza `curl` para descargar el archivo comprimido de AWS CLI versión 2 desde el sitio oficial:

   ```bash
   curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
   
2. **Descomprimir el archivo**:

   Una vez descargado el archivo, utiliza unzip para extraerlo:
   
   ```bash
   unzip awscliv2.zip

2. **Instalar AWS CLI v2**:
   
   Con los archivos extraídos, ejecuta el script de instalación con permisos de administrador:
   
   ```bash
   sudo ./aws/install

4. **Verificar la instalación**:
   
   Para asegurarte de que AWS CLI v2 se ha instalado correctamente, puedes verificar su versión:
   
   ```bash
   aws --version
