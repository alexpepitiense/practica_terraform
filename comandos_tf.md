# Uso básico de Terraform

Este documento explica los comandos fundamentales de Terraform para la gestión y despliegue de infraestructura como código.

## Comandos de Terraform

### 1. `terraform init`

Este comando se usa para inicializar un directorio de trabajo de Terraform. Prepara el directorio para otros comandos y asegura que todo esté listo para que Terraform ejecute tu configuración. Esto incluye descargar los módulos necesarios y establecer los backends.

```bash
terraform init
```

### 2. `terraform plan`

Crea un plan de ejecución, que te permite revisar qué cambios se aplicarán a tu infraestructura antes de aplicarlos realmente. Esto es útil para hacer una verificación antes de realizar cambios significativos.

```bash
terraform plan
```

Este comando es una extensión del comando plan y permite guardar el plan de ejecución en un archivo. Esto garantiza que el plan exacto revisado pueda ser aplicado después, sin la posibilidad de cambios inesperados entre la planificación y la aplicación.

```bash
terraform plan --out s3.plan
```

### 3. `terraform apply`

Se utiliza para aplicar los cambios necesarios para alcanzar el estado deseado de la configuración. Por defecto, Terraform te pedirá que revises el plan y apruebes la ejecución.

```bash
terraform apply
```

Para automatizar la aplicación de cambios sin intervención manual, puedes usar el flag --auto-approve=true. Esto es útil en scripts automatizados o en entornos donde no se desea una interacción manual.

```bash
terraform apply --auto-approve=true
```

Si necesitas forzar la recreación de un recurso específico (por ejemplo, una instancia de AWS), puedes usar el flag --replace seguido del identificador del recurso.

```bash
terraform apply --replace=aws_instance.public_instance
```

### 4. `terraform destroy`

Para eliminar todos los recursos definidos en tu configuración de Terraform, puedes usar el comando terraform destroy. Este comando destruirá la infraestructura gestionada por Terraform, por lo que se debe usar con cuidado.

```bash
terraform destroy
```
