module "kubernetes" {
  source = "./kubernetes"
  region = "us-east1"

  project_id_map = {
    default = "k8s-demo-project-291504"
  }
}

output "connection-command" {
  value = "${module.kubernetes.connect-string}"
}
