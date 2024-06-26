#### ````terraform init```` 
Inicializa un nuevo directorio de configuración de Terraform. Descarga y actualiza los proveedores requeridos y módulos.

#### ````terraform get```` Descarga e instala los módulos mencionados en la configuración de Terraform.

#### ````terraform plan```` 
Muestra un plan detallado de lo que Terraform hará cuando se aplique. Indica los recursos que se crearán, actualizarán o eliminarán.

#### ````terraform apply```` 
Aplica los cambios definidos en la configuración de Terraform al entorno objetivo. Crea, actualiza o elimina recursos según el plan generado.

#### ````terraform destroy```` 
Destruye todos los recursos creados por la configuración de Terraform. ¡Cuidado! Este comando elimina recursos.

#### ````terraform output```` 
Muestra las salidas definidas en el archivo output.tf, proporcionando información útil después de aplicar la configuración.

#### ````terraform refresh```` 
Actualiza el estado de Terraform con la información actual del entorno objetivo. Útil para sincronizar el estado.

#### ````terraform state list```` 
Permite gestionar el estado de Terraform, incluida la importación y extracción de recursos del estado.

#### ````terraform show```` 
Muestra el estado actual de recursos y componentes.

#### ````terraform validate```` 
Verifica la sintaxis y la validez de la configuración de Terraform en busca de errores y problemas.

#### ````terraform fmt```` 
Reformatea los archivos de configuración de Terraform para seguir una convención de estilo consistente.