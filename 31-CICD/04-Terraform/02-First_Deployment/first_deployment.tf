provider "aws" {
  access_key = "AKIAYKBCL35Z4D6JMLFS"
  secret_key = "AhZkSLcIRxe7i2PMEzHReWWMhCyciG1QD0E3sUzM"
  region     = "us-west-2"
}
resource "aws_instance" "example" {
  ami           = "ami-0994c095691a46fb5"
  instance_type = "t2.micro"
}
