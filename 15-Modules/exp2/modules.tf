module "frontend" { 
  source = "./aws_instances"
}



module "backend" { 
  source = "./aws_instances"
  ec2_count = 2 
}
