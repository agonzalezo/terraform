output "container_ip" {
  value = docker_container.web[*].network_data[0].ip_address
}

##  Output to show the listening address from the container
output "container_logs" {
  # value = data.docker_logs.container_log
  value = { for name, log in data.docker_logs.container_log : name => log.logs_list_string[4] }
}