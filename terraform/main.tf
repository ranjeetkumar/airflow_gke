provider "google" {
  project = "perfect-science-437706-m0"
  region  = "us-central1"
}

# Create GKE cluster
resource "google_container_cluster" "gke_cluster" {
  name     = "gke-cluster-test"
  location = "us-central1"
  deletion_protection = false
  # GKE cluster settings
  initial_node_count = 1

  node_config {
    
    disk_size_gb = 10  # Adjust disk size to reduce SSD quota usage
  }
}