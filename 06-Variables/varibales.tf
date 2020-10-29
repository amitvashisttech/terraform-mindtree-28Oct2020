# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  version = ">=3.7,<=3.11"
}

variable "zones" { 
 default = ["us-east-1a", "us-east-1b"]
}


resource "aws_instance" "frontend_east" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
  count         = 2 
  availability_zone = var.zones[count.index]
}

