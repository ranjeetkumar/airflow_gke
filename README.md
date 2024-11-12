
# GKE Cluster and Airflow Deployment with Terraform, Helm, and Kubernetes

## Step 1: Initialize Terraform
First, initialize Terraform in your working directory to set up the environment and download necessary provider plugins.
```bash
terraform init
```

## Step 2: Apply Terraform Configuration
Apply the Terraform configuration to create or update the infrastructure as defined in your `.tf` files.
```bash
terraform apply
```

## Step 3: Authenticate with GKE Cluster
Retrieve the credentials for your GKE cluster to interact with it using `kubectl`.
```bash
gcloud container clusters get-credentials gke-cluster-test --zone us-central1
```

## Step 4: Create Namespace for Airflow
Create a separate namespace in Kubernetes for Airflow to keep resources organized.
```bash
kubectl create namespace airflow
```

## Step 5: Add Apache Airflow Helm Repository
Add the Apache Airflow Helm repository to your Helm configuration to enable installation of Airflow.
```bash
helm repo add apache-airflow https://airflow.apache.org
helm repo update
```

## Step 6: Install Airflow using Helm
Install Airflow in the `airflow` namespace using the custom values specified in `helm/values.yaml`.
```bash
helm install airflow apache-airflow/airflow -n airflow -f helm/values.yaml
```

## Step 7: Access Airflow Web Server
Forward the Airflow web server service port to your local machine to access it through `http://localhost:8080`.
```bash
kubectl port-forward svc/airflow-webserver 8080:8080 -n airflow
```

## Step 8: Destroy Terraform Resources
When you no longer need the infrastructure, use Terraform to destroy all resources.
```bash
terraform destroy
```
