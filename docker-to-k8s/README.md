- [3 different ways of doing the same thing](#3-different-ways-of-doing-the-same-thing)
  - [Containers only](#containers-only)
  - [Docker compose](#docker-compose)
  - [Kubernetes](#kubernetes)
    - [Why?](#why)
- [Extra stuff](#extra-stuff)
    - [K3D instructions](#k3d-instructions)
    - [Comparison diagram of docker vs kubernetes](#comparison-diagram-of-docker-vs-kubernetes)


# 3 different ways of doing the same thing

*This is just an example/ not homework*

Docker can do what Docker Composer can do what Kubernetes can do, so why learn all 3?

In learning about containers, a few questions come to mind about what do you need to know about containers if your goal is to utilize kubernetes. Or if you're a developer, why do you need to learn about kubernetes at all?

- What does docker offer in the comparison to kubernetes or docker compose?
- Don't they are do the same thing?

The answer is yes and no. Let's go through an example from the standpoint of a developer who is learning to make database calls from their application.

They need to test against mariadb latest and mariadb 10. [Dockerhub link.](https://hub.docker.com/_/mariadb)

## Containers only

The developer can choose to use docker to meet their needs. 4 commands to run.

```bash
# First, create the network
docker network create mariadb-test

# Run mariadb latest
#   - removes itself
#   - detached
#   - password is "secret"
docker run --detach --rm --name db1 --env MARIADB_ROOT_PASSWORD=secret --net mariadb-test mariadb:latest

# Run mariadb latest
#   - removes itself
#   - detached
#   - password is "secret"
docker run --detach --rm --name db2 --env MARIADB_ROOT_PASSWORD=secret --net mariadb-test mariadb:10

# Run adminer to access the mariadb databases
#   - removes itself
#   - detached
#   - password is "secret"
#   - port is 8080
docker run --rm -d --name adminer --net mariadb-test -p 8080:8080 adminer
```

Our dev can go to [localhost:8080](http://localhost:8080/?server=mariadb-10) to access the databases

- databases: db1 or db2
- user: root
- password: secret

## Docker compose

*you will need to stop the adminer container from the above as the docker compose example reususes the 8080 port*

The same thing can be accomplished in docker compose. The reasons for this could range, depending on the scenario. Generally though:

- One command to run instead of 4
- Less to remember
- Less to troubleshoot
- 

```bash
# Run the containers
cd welcome-students/docker-to-k8s
docker compose up

# Run detached
docker compose up -d

# Stop the containers
docker compose stop
```

Our dev can do reuse the same instructions from before: Go to [localhost:8080](http://localhost:8080/) to access the databases

- databases: db1 or db2
- user: root
- password: secret

## Kubernetes

Now kubernetes, and why use it in locally if docker compsoe works so well? Great question.

There are a few reasons but lets concentrate on 2 that have to do with kubernetes being able to run the same everywhere.

- Closely ties developers to prod practices (tight feedback loops)
- Still simple commands

```bash
# start your minikube k8s env
minikube start

# navigate to the example dir
cd welcome-students/docker-to-k8s

# apply to the kubernetes manifests
kubectl apply -f k8s/.

# expose the k8s svc
minikube service adminer-svc --url

# paste output service in browser
# ex 192.x.x.1:30080
```

Our dev can mostly reuse the same instructions: Go to URL in the output to access the databases via adminer

- databases: db1 or db2
- user: root
- password: secret

### Why?

The one adminer container was broken up into 3 things: ingress, service, and deployment. The same thing happened with the MariaDb containers.

Kubernetes is opinionated. To run everywhere, it make assumptions about the best way to do things. 

- The only way to access as application running in pod is a service. 
- The only way to save data outside the pod, is perisistent volumes.
- there are many others

These components are very powerful when broken apart and managed seperately, allowing for seamless upgrades, blue/green deployments, and automatic loadbalancing.

# Extra stuff

### K3D instructions

```bash
# need to expose the lb in k3d
k3d cluster create derp -p "8081:80@loadbalancer" -a 2

# optional: add laptop to /etc/hosts
# 127.0.0.1       k8s.laptop
```

[Good link on k3d ingress](https://rob-mengert.medium.com/understanding-k3d-ingress-b94697638f3b)

### Comparison diagram of docker vs kubernetes

![diagram](./index.svg)