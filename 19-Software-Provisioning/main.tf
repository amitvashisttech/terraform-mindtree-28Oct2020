resource "aws_instance" "dev-app" {
  ami                    = "ami-0947d2ba12ee1ff75"
  instance_type          = lookup(var.instance_type, terraform.workspace)
  count                  = lookup(var.instance_count, terraform.workspace)
  key_name               = var.key_name
  vpc_security_group_ids = [var.sg_id]
  tags = {
    Name = local.default_name
  }

  connection {
    type     = "ssh"
    user     = "ec2-user"
    private_key = file(var.pvt_key)
    host     = self.public_ip
  }
  
  provisioner "file" { 
     source = "./frontend"
     destination = "~/"
  }

  provisioner "remote-exec" { 
    inline = [
      "chmod +x ~/frontend/run_frontend.sh", 
      "sudo ~/frontend/run_frontend.sh",
   ]

 } 
}
