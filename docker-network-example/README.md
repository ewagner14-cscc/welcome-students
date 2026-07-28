docker network example
docker network create better-example
create 4 containers, with 3 on a user defined bridge network
docker run -dit --rm --name alpine-linux1 --network better-example alpine ash
docker run -dit --rm- -name alpine-linux2 --network better-example alpine ash
docker run -dit --rm --name alpine-linux3 --network better-example alpine ash
other container on default bridge network
docker run -dit --rm --name alpine-linux4 alpine ash
list off networks
docker network ls
Inspect the better example network
docker network inspect better-example
do you see the 3 containers that were attached?
alpine-linux1-3?
Attach to the alpine-linux1 container, and ping the 3 other containers
first, attach to the alpine-linux1 container
once you exit the container, it will be stopped, and you will need to start it again
2 options
docker exec -it alpine-linux1 sh
docker container attach alpine-linux1
now, ping the other containers
Does it work?
ping -c 2 alpline-linux2
ping -c 2 alpine-linux3
ping -c 2 alpine-linux4
what happened here? Why couldnt the container ping the 4th container? It was not on the better-example network and it was on the bridge network.