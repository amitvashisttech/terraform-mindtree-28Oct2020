# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}


resource "aws_instance" "web" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}
