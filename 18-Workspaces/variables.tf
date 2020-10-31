data "aws_ami" "myami" {
  most_recent = true
  owners  = ["amazon"]

  filter {
    name = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

locals { 
  default_name = "${join("-", list(terraform.workspace, "example"))}"
}


variable "region" {
  default = "us-east-1"
}


variable "instance_type" { 
  type = map
  default = { 
      default = "t2.nano"
      dev     = "t2.micro"
      prod    = "t2.large"
      mindtree = "x1.large"
  }

}



variable "instance_count" { 
  type = map
  default = { 
      default = "1"
      dev     = "2"
      prod    = "5"
      mindtree = "7"
  }

}
