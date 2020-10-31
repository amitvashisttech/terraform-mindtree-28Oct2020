resource "aws_instance" "dev-app" {
  ami = data.aws_ami.myami.id
  instance_type = lookup(var.instance_type, terraform.workspace)
  tags = {
    Name = local.default_name
  }
}
