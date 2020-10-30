data "aws_availability_zones" "zones_east" {}

variable "multi-region-deployment" {
  default = false
}

variable "project-name" {
  default = "Terraform-demo"
}

variable "project-name-2" {
  default = "Production-AV"
}

locals {
  default_frontend_name = "${join("-", list(var.project-name, "Frontend" ))}"
  default_backend_name = "${join("-", list(var.project-name, "Backend" ))}"
  west_frontend_name = "${join("-", list(var.project-name-2, "Frontend" ))}"
  west_backend_name = "${join("-", list(var.project-name-2, "Backend" ))}"
}

locals {
  some_tags = {
    Owner = "DevOps Team"
    Project = "Initial Demo Project"
    Server  = "Backend"
    Name    = local.west_frontend_name
  }
}

variable "ec2_count" { 
  default = "1"
}


variable "region" { 
  default = "us-east-1"
}


variable "ami" { 
  type = map
  default = { 
  "us-east-1" = "ami-0947d2ba12ee1ff75"
  "us-west-1" = "ami-0e4035ae3f70c400f"
  "ap-south-1" = "ami-0e306788ff2473ccb"
  }
}
