variable "key_name" {
  default = "terraform-demo"
}

variable "pvt_key" {
  default = "/root/.ssh/amitvashist-terraform.pem"
}

variable "us-east-zones" {
  default = ["us-east-1a", "us-east-1b"]
}

variable "sg-id" {
  default = "sg-00691bf04ae335d59"
}
