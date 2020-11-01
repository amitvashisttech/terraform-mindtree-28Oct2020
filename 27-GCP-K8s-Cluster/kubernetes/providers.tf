provider "google" {
  project = "${var.project_id_map[terraform.workspace]}"
  region  = "${var.region}"
  credentials  = "${file("/root/.ssh/k8s-demo-project-sa.json")}"
  version = "2.19.0"
}

