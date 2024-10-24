# testing out services

This is an experiment to show you how services can be configured to point to like resources.

```bash
minikube stop 
minikube delete
minikube start
kubectl apply -f .
curl --no-keepalive http://localhost:8080/api/v1/namespaces/default/services/nginx-service2/proxy/
curl --no-keepalive http://localhost:8080/api/v1/namespaces/default/services/nginx-service1/proxy/
```

Try out the curl_script.sh for an automated test.