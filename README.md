# Python API Monitoring in Kubernetes (Minikube)

This guide explains how to set up, monitor, and tear down a Python API in a Kubernetes environment using Minikube. Follow these steps to quickly get your environment running and understand the monitoring setup.

---

## Prerequisitesexample

Before starting, ensure you have the following installed:

1. [Minikube](https://minikube.sigs.k8s.io/docs/start/)
2. [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
3. [Bash](https://www.gnu.org/software/bash/)

---

## Steps to Start the Environment

### 1. Start Minikube

Run the following commands to initialize Minikube and enable the required add-ons:

```bash
minikube start
minikube addons enable metrics-server
```

This will start a local Kubernetes cluster and enable the metrics server for monitoring purposes.

### 2. Run the Starter Script

Execute the starter script to deploy the API and configure port-forwarding:

```bash
bash StarterK8s.sh
```

The script will:
- Deploy the Python API in the Minikube cluster.
- Set up monitoring tools.
- Establish port-forwarding for API and monitoring dashboards.

### 3. Verify Deployment

Check the deployed resources:

```bash
kubectl get all
```

This command should list the running pods, services, and deployments.

---

## Access the API and Monitoring Tools

Once the setup is complete, you can access the following:

- **API Endpoint:** Use the forwarded port displayed by the script.
- **Monitoring Dashboards:** Access Grafana and Prometheus dashboards using the URLs provided in the script output.

---

## Tearing Down the Environment

To clean up and remove all resources, run the cleanup script:

```bash
bash deleall.sh
```

This script will:
- Delete all Kubernetes resources related to the API and monitoring.
- Stop the port-forwarding processes.

---

## Additional Information

### Folder Structure

```
.
├── crudAPI/..                # Python Crud API 
├── grafana/..                # Provisioning dashboards and datasources
├── script/
    ├── StarterK8s.sh         # Script to start the environment
    ├── deleall.sh            # Script to tear down the environment
├── k8s-manifests/            # Kubernetes manifests for API and monitoring
├── README.md                 # Documentation (this file)
```

### Monitoring Setup

- **Metrics Server:** Enables resource monitoring for pods and nodes.
- **Prometheus:** Collects and stores metrics for the API.
- **Grafana:** Visualizes metrics with preconfigured dashboards.

---

## Contact Us

For more information or support, visit [Our Company Portfolio](https://oppervision.com/portifolio).
