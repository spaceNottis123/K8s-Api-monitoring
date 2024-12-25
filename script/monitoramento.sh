#!/bin/bash

# ========================================================================
# Kubernetes Prometheus and Grafana Installation Script
# Purpose: This script ensures that Prometheus and Grafana are installed
#          on the Kubernetes cluster, waits for the pods to be ready,
#          and provides reminders for accessing Grafana and retrieving
#          the admin password.
# ========================================================================

# ========================================================================
# Function to check and install Prometheus if not already installed
# ========================================================================
check_prometheus() {
    echo "Verificando instalação do Prometheus..."
    if kubectl get deployment prometheus &> /dev/null; then
        echo "Prometheus já está instalado."
    else
        echo "Instalando o Prometheus..."
        kubectl apply -f ../k8s-manifests/prometheus-deployment.yaml
    fi
}

# ========================================================================
# Function to check and install Grafana if not already installed
# ========================================================================
check_grafana() {
    echo "Verificando instalação do Grafana..."
    if kubectl get deployment grafana &> /dev/null; then
        echo "Grafana já está instalado."
    else
        echo "Instalando o Grafana..."
        kubectl apply -f ../k8s-manifests/grafana-deployment.yaml
        kubectl expose deployment grafana --type=LoadBalancer --name=grafana-service
    fi
}

# ========================================================================
# Function to wait until the Prometheus and Grafana pods are ready
# ========================================================================
wait_for_pods() {
    echo "Aguardando os pods do Prometheus e Grafana ficarem prontos..."
    kubectl rollout status deployment/prometheus-server
    kubectl rollout status deployment/grafana
}

# ========================================================================
# Main function to orchestrate the installation and setup
# ========================================================================
main() {
    # Verificar e instalar Prometheus e Grafana, se necessário
    check_prometheus
    check_grafana

    # Aguardar até que os pods estejam prontos
    wait_for_pods

    # Exibir o status dos serviços
    echo "Serviços Kubernetes ativos:"
    kubectl get svc
}

# ========================================================================
# Execute the main function
# ========================================================================
main

# ========================================================================
# Lembretes para acessar o Grafana e obter a senha de acesso:
# ========================================================================
echo -e "\nLembretes:"
echo "1. Para acessar o Grafana, execute o comando abaixo para redirecionar a porta para sua máquina local:"
echo "   kubectl port-forward deployment/grafana 3000:3000"
echo "   Agora você pode acessar o Grafana através de http://localhost:3000."

echo -e "\n2. Para obter acesso ao Grafana, use o usuario admin e senha admin"
