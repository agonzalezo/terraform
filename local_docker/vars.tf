resource "time_sleep" "sleeping" {
  create_duration = "5s"
  depends_on = [ docker_container.web ]
}

data "docker_logs" "container_log" {
  depends_on = [ time_sleep.sleeping ]
  for_each = { for c in docker_container.web : c.name => c }
  name = each.value.name
}

variable "container_prefix" {
  type = string
 default = "web" 
}