#!/bin/bash

bash deployAPI.sh
sleep 10
bash monitoramento.sh
sleep 10
bash provisionamento.sh
sleep 10

echo "Iniciando port-forward para os serviços..."
nohup kubectl port-forward svc/flask-api-service 5000:5000 > flask-api.log 2>&1 &
check_error "Port-forward API"
nohup kubectl port-forward deployment/grafana 3000:3000 > grafana.log 2>&1 &
check_error "Port-forward Grafana"
nohup kubectl port-forward svc/prometheus-service 9090:9090 > prometheus.log 2>&1 &
check_error "Port-forward Prometheus"

echo "Port-forward configurado! Logs disponíveis nos arquivos correspondentes."

# 6. Mostrando status dos recursos
echo "Status dos recursos Kubernetes:"
kubectl get pods -n default
kubectl get svc -n default
