# A unique situation 

YAML can be tricky. A student ran into an issue that was solved with commenting out a single line, and it taught me a lot about how services work in kubernetes. The following is an explanation as to why that happeded.

## Services search for pods, pods do not search for services

There is a one-way relationship between services and pods in a generic kubernetes cluster. Traffic comes into the cluster, gets routed to a service, and the service looks for workloads to send the traffic too.  The way it looks for traffic is defined in the spec for the service. I have two working examples of how this works:
- NotJeffs
- Jeffs

start up a new minikube ```minikube start``` and run ```kubectl apply -f .``` in this directory to see the examples. Then run the ```kubectl proxy --port=8080``` command to use the links.

### Looking for NotJeffs

In the week 4 homework, a named targetPort was the issue that prevented the Service from finding a suitable pod. It was was like the Service was given the wrong information.

Lets imagine a service is a person (SvcPerson) on a podium at a conference (spec.selector.conference: present), trying to get a specific someone's attention. Someone had told them, the person's name, so it would be easy, right? "Jeff!" yells the SvcPerson.

[Can't find Jeff](http://127.0.0.1:8080/api/v1/namespaces/default/services/cant-find-jeff-svc/proxy/)

- look at the cant-find-jeff-svc.yml
- look at the attendee yaml files
- The service is yelling for Jeff on the target port but it cannt find him.

Lets say SvcPerson didn't get the wrong name, and instead had some other way of finding Jeff-like NotJeffs. Our SvcPerson knew that by selecting for the right information, they could find suitable NotJeffs. Instead of yelling for a name, they know that NotJeffs, have black hair, are right-handed, and are wearing red shirts. 


## reference Pods with the TargetPort

https://kubernetes.io/docs/concepts/services-networking/service/#field-spec-ports


### sending different connections to different pods

https://kubernetes.io/docs/concepts/services-networking/service/#field-spec-ports

```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app.kubernetes.io/name: MyApp
  ports:
    - name: http
      protocol: TCP
      port: 80
      targetPort: 9376
    - name: https
      protocol: TCP
      port: 443
      targetPort: 9377
    - name: sftp
      protocol: TCP
      port: 22
      targetPort: 9378
    - name: email
      protocol: TCP
      port: 25
      targetPort: 9379
```

Or You could use named ports 
```yaml
apiVersion: v1
kind: Service
metadata:
  name: my-service
spec:
  selector:
    app.kubernetes.io/name: MyApp
  ports:
    - name: http
      protocol: TCP
      port: 80
      targetPort: http_pod_port
      ## Pod spec.containers.ports.containerPort: 9376
    - name: https
      protocol: TCP
      port: 443
      targetPort: https_pod_port
      ## Pod spec.containers.ports.containerPort: 9377
    - name: sftp
      protocol: TCP
      port: 22
      targetPort: sftp_pod_port
      ## Pod spec.containers.ports.containerPort: 9378
    - name: email
      protocol: TCP
      port: 25
      targetPort: email_pod_port 
      ## Pod spec.containers.ports.containerPort: 9379
```

http://127.0.0.1:8080/api/v1/namespaces/default/services/nginx-service/proxy/

http://127.0.0.1:8080/api/v1/namespaces/default/services/notjeff-selector-svc/proxy/


http://127.0.0.1:8080/api/v1/namespaces/default/services/cant-find-jeff-svc/proxy/


http://127.0.0.1:8080/api/v1/namespaces/default/services/jeff-finder-namedport-svc/proxy/