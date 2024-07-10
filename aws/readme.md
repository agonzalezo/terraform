
- **modules/**: Contiene los módulos reutilizables.

- **modules/infrastructure**: Contiene el código necesario para desplegar los componentes de red (vpc,subnet,igw,ngw, etc...).

- **modules/infrastructure**: Contiene el código necesario para desplegar los componentes de seguridad (security groups,ssh-keys, etc...).

- **main.tf**: Archivo principal donde se invocan los modulos que se quieren desplegar.

- **global_vars.tf**: Definiciones de variables de globales (aws profile, region).

- **outputs.tf**: Definiciones de salidas de Terraform.


## Requisitos

- [Terraform](https://www.terraform.io/downloads.html) >= 0.12
- Credenciales de AWS configuradas en tu máquina local (a través de `aws configure` o variables de entorno).

## Uso
- Inicializar
```bash
terraform init
```
- Planificar la creación de los recursos
```bash
terraform plan
```
- Desplegar los recursos
```bash
terraform apply
```
### Clonar el repositorio

```bash
git clone https://github.com/agonzalezo/terraform.git && cd terraform/aws