variable "region" {
  default = "us-east-1"
}

data "aws_ami" "myami" {
  most_recent = true
  owners  = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

variable "ec2_count" {
  default = "1"
}

