# Instructions

## To deploy spring boot app

```bash
$ kubectl apply -f k8s/spring-boot-prometheus-deployment.yaml
$ kubectl apply -f k8s/spring-boot-prometheus-service.yaml
```

## Create new namespace for monitoring tools stack

```bash
$ kubectl apply -f k8s/helm/monitoring/namespace.yml
```

## Deploy premothues in k8s cluster

```bash
$ helm install prometheus stable/prometheus --namespace monitoring
```

## Deploy grafana in k8s cluster


```bash
$ kubectl apply -f k8s/helm/monitoring/grafana/config.yml
$ helm install grafana stable/grafana -n monitoring
```
## Access spring boot add jvm stats in grafana

```bash
# Get grafana password
$ kubectl get secret --namespace monitoring grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

1. Login into grafana
2. Create prometheus data source
3. Import spring boot dashboard with id 10280

## Deploy loki in k8s cluster


```bash
$ helm upgrade --install loki --namespace=monitoring loki/loki-stack
```
## Access spring boot logs in grafana

1. Login into grafana
2. Create loki data source
3. Go to explore and select loki data source and select spring boot app pod
