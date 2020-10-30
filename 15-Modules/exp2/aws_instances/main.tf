resource "aws_instance" "instance" {
  ami           = var.ami[var.region]
  instance_type = "t2.micro"
  availability_zone = data.aws_availability_zones.zones_east.names[count.index]
  count             = var.ec2_count
  lifecycle {
    create_before_destroy = true
  }

 tags = {
   Name = local.default_frontend_name
 }

}
