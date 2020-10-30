terraform { 
  backend "s3" { 
   bucket = "terraform-demo-av-30oct2020"
   key = "terraform.tfstate"
   region = "us-east-1"
 }
}
