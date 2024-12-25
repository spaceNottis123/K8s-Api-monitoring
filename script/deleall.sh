#!/bin/bash

# ========================================================================
# Kubernetes Cleanup Script
# Purpose: This script handles the cleanup of Kubernetes resources,
#          including deployments, services, configmaps, pods, Helm releases,
#          and terminates nohup processes for kubectl port-forward.
# ========================================================================

# Constants
APP_NAME="flask-api"                          # Name of the application deployment
PROMETHEUS_DEPLOYMENT="prometheus"            # Prometheus deployment name
GRAFANA_DEPLOYMENT="grafana"                  # Grafana deployment name
NAMESPACE="default"                           # Namespace (default or custom namespace)

# ========================================================================
# Function to delete Kubernetes deployments
# ========================================================================
delete_deployments() {
    echo "Deleting deployments..."
    kubectl delete deployment $APP_NAME --namespace=$NAMESPACE --ignore-not-found=true
    kubectl delete deployment $PROMETHEUS_DEPLOYMENT --namespace=$NAMESPACE --ignore-not-found=true
    kubectl delete deployment $GRAFANA_DEPLOYMENT --namespace=$NAMESPACE --ignore-not-found=true
}

# ========================================================================
# Function to delete Kubernetes services
# ========================================================================
delete_services() {
    echo "Deleting services..."
    kubectl delete svc $APP_NAME-service --namespace=$NAMESPACE --ignore-not-found=true
    kubectl delete svc prometheus-service --namespace=$NAMESPACE --ignore-not-found=true
    kubectl delete svc grafana-service --namespace=$NAMESPACE --ignore-not-found=true
}

# ========================================================================
# Function to delete Kubernetes ConfigMaps
# ========================================================================
delete_configmaps() {
    echo "Deleting ConfigMaps..."
    kubectl delete configmap prometheus-config --namespace=$NAMESPACE --ignore-not-found=true
}

# ========================================================================
# Function to delete Kubernetes pods by selector
# ========================================================================
delete_pods() {
    echo "Deleting all pods..."
    kubectl delete pods --selector=app=$APP_NAME --namespace=$NAMESPACE --ignore-not-found=true
    kubectl delete pods --selector=app=prometheus --namespace=$NAMESPACE --ignore-not-found=true
    kubectl delete pods --selector=app=grafana --namespace=$NAMESPACE --ignore-not-found=true
}

# ========================================================================
# Function to terminate nohup port-forward processes
# ========================================================================
terminate_nohup_processes() {
    echo "Terminating nohup kubectl port-forward processes..."
    pids=$(ps aux | grep 'kubectl port-forward' | grep -v grep | awk '{print $2}')
    if [ -n "$pids" ]; then
        echo "Found nohup kubectl port-forward processes: $pids"
        kill -9 $pids
        echo "Processes terminated successfully!"
    else
        echo "No nohup kubectl port-forward processes found."
    fi
}

# ========================================================================
# Function to verify cleanup success
# ========================================================================
verify_cleanup() {
    echo "Verifying cleanup..."
    kubectl get all --namespace=$NAMESPACE
}

# ========================================================================
# Main execution function to run all cleanup tasks
# ========================================================================
main() {
    echo "Starting Kubernetes cleanup..."
    terminate_nohup_processes
    delete_deployments
    delete_services
    delete_configmaps
    delete_pods
    verify_cleanup

    echo "Cleanup completed successfully!"
}

# ========================================================================
# Execute the main function to trigger the cleanup
# ========================================================================
main
