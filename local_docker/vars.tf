
data "docker_logs" "container_log" {
  for_each = { for c in docker_container.web : c.name => c }
  name = each.value.name
}

variable "container_prefix" {
  type = string
 default = "web" 
}