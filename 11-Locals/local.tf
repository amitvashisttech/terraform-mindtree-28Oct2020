provider "aws" { 
version = "3.10"
region  = "us-east-1"
}


provider "aws" { 
version = "3.10"
region  = "us-west-1"
alias   = "us-west-1"
}

variable "zones_east" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "zones_west" {
  default = ["us-west-1a", "us-west-1b"]
}

variable "multi-region-deployment" {
  default = true
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



resource "aws_instance" "east_frontend" {
  ami           = "ami-0dba2cb6798deb6d8"
  instance_type = "t2.micro"
  availability_zone = var.zones_east[count.index]
  count             = 2
  depends_on    = [ aws_instance.east_backend ]
  lifecycle {
    create_before_destroy = true
  }

 tags = {
   Name = local.default_frontend_name
 }
  
}

resource "aws_instance" "west_frontend" {
  ami           = "ami-0e4035ae3f70c400f"
  instance_type = "t2.micro"
  availability_zone = var.zones_west[count.index]
  count             = var.multi-region-deployment ? 2 : 0
  depends_on    = [ aws_instance.west_backend ]
  provider      = aws.us-west-1
  lifecycle {
    create_before_destroy = true
  }
  tags = local.some_tags
}


resource "aws_instance" "east_backend" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  availability_zone = var.zones_east[count.index]
  count             = 2
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name = local.default_backend_name
  }
}


resource "aws_instance" "west_backend" {
  ami           = "ami-0e4035ae3f70c400f"
  instance_type = "t2.micro"
  availability_zone = var.zones_west[count.index]
  count             = var.multi-region-deployment ? 2 : 0
  provider      = aws.us-west-1
  lifecycle {
    prevent_destroy = true
  }
  tags = {
    Name = local.west_backend_name
  }
}

output "PublicIP_East_Frontend" {
  value = aws_instance.east_frontend.*.public_ip
}

output "PublicIP_East_Backend" {
  value = aws_instance.east_backend.*.public_ip
}

