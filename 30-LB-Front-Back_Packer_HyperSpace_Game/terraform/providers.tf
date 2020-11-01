provider "google" {
  project = "k8s-demo-project-291504"
  region  = "us-west1"
  credentials  = "${file("/root/.ssh/k8s-demo-project-sa.json")}"
  version = "2.19.0"
}

