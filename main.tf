terraform {
  /*cloud {
    organization = "hamzashoul"
    workspaces {
      name = "docker-tuto"
    }
  }*/
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0.1"
    }
  }
}



provider "docker" {
}

resource "docker_image" "nginx" {
  name         = "nginx"
  keep_locally = true
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.image_id
  #name  = "nginx-created-by-terraform-test"
  name = var.container_name
  ports {
    internal = 80
    external = 8999
  }
}
