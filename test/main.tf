# configure the docker provider
provider "docker" {
   host = "unix:///var/run/docker.sock"
}

# create a container
resource "docker_image" "ghost_img" {
  name = "ghost:alpine"
}


resource "docker_container" "my_ghost" {
  image = "${docker_image.ghost_img.latest}" 
  name = "ghost"
}

variable "who" {
  description = "Name"
  default = "james"
  
}

output "james" {
  value = "${var.who}"
  description = "value of the james veriable"
}
