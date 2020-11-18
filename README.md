# Instructions

## To deploy spring boot app, prometheus, grafana and loki in minikube

```bash
$ ./run.sh
```

## After all pods are up, portforward to access grafana

```bash
$ kubectl port-forward service/grafana 3000:80
```
## Access spring boot add jvm stats in grafana

```bash
# Get grafana password
$ kubectl get secret grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```

1. Login into grafana
2. Create prometheus data source
3. Import spring boot dashboard with id 10280

## Access spring boot logs in grafana

1. Login into grafana
2. Create loki data source
3. Go to explore and select loki data source and select spring boot app pod

## Acccess springboot app and view jvm stats in grafana

```bash
$ minikube service springboot-app
```
