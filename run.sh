#!/bin/bash

minikube start

helm install springboot-app springboot

helm repo add stable https://charts.helm.sh/stable
helm repo add loki https://grafana.github.io/loki/charts
helm repo update

helm install prometheus stable/prometheus
helm install grafana stable/grafana
helm install loki loki/loki-stack
