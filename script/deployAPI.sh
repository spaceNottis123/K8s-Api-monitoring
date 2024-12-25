#!/bin/bash

# Este script aplica o manifesto Kubernetes usando a imagem Docker já existente no Docker Hub.

# Carregar variáveis do arquivo .env
if [ -f ".env" ]; then
    source .env
else
    echo "⚠️ [WARNING] Arquivo .env não encontrado. Usando valores padrão."
fi

# Variáveis
APP_NAME="${APP_NAME:-flask-api}"
DOCKER_IMAGE="${DOCKER_IMAGE:-enzotrevisan123/$APP_NAME:latest}"
K8S_DEPLOYMENT_FILE="${K8S_DEPLOYMENT_FILE:-../k8s-manifests/flask-api-deployment.yaml}"

# Função para verificar dependências
check_dependencies() {
    for cmd in kubectl; do
        if ! command -v $cmd &> /dev/null; then
            echo "❌ [ERROR] $cmd não está instalado. Instale antes de continuar."
            exit 1
        fi
    done
}

# Verificar dependências
check_dependencies

# Aplicar Deployment
echo "🚀 [INFO] Applying Kubernetes Deployment..."
kubectl apply -f $K8S_DEPLOYMENT_FILE

# Confirmar estado do deployment
echo "✅ [INFO] Kubernetes deployment applied successfully. Current state:"
kubectl get deployments