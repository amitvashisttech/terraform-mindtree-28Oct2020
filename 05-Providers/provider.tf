# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  version = ">=3.7,<=3.11"
}


provider "aws" {
  region = "us-west-1"
  version = ">=3.7,<=3.11"
  alias   = "us-west-1"
}


resource "aws_instance" "frontend_east" {
  ami           = "ami-0947d2ba12ee1ff75"
  instance_type = "t2.micro"
}



resource "aws_instance" "frontend_west" {
  count  = 1
  ami           = "ami-0e4035ae3f70c400f"
  instance_type = "t2.micro"
  provider      = aws.us-west-1
}
