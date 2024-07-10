
variable "ssh_pub_path" {
  description = "Path where is located the ssh public key"
  default = "C:\\Users\\Alex\\.ssh\\id_rsa.pub"
}

resource "aws_key_pair" "ssh_key" {
  key_name = "${var.environment}_ssh_key"
  public_key = file(var.ssh_pub_path)
  tags = {
    Name = "${var.environment}_ssh_key"
  }
}