# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "frontend" {
 # ami           = "ami-0dba2cb6798deb6d8"
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  depends_on    = [aws_instance.backend]

  lifecycle { 
     create_before_destroy = true
  }
}



resource "aws_instance" "backend" {
  count  = 2 
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  lifecycle { 
    prevent_destroy = false
  }

 timeouts {
   create = "60m"
   delete = "2h"
 }
}

output "backend_public_ips" {
  value = aws_instance.backend.*.public_ip
}


output "backend_public_dns" {
  value = aws_instance.backend.*.public_dns
}

output "backend_ips" {
 value = "${list(aws_instance.backend.*.public_ip, aws_instance.backend.*.public_dns)}"
}


output "frontend_public_ips" {
  value = aws_instance.frontend.public_ip
}
