#!/bin/bash
# Documentation: https://docs.docker.com/
# docker inspect                                                                = details of on container configdo
# docker container run -it                                                      = Start new container interactively 
# docker container exec -it $nginx $bash                                        = to get into container with bash
# docker container inspect --format '{{ .NetworkSettings.IPAddress }}' nginx

#######################################################################################
# Create Docker Containers 
# (run on the for ground)
docker container run --publish 80:80 nginx

#--detach (make it run on the background)
docker container run --publish 80:80 --detach nginx

#--name (name the container)
docker container run --publish 80:80 --detach --name nginx nginx
docker container run --publish 8080:80 --detach --name httpd httpd

#--env to pass a variable
docker container run --publish 3306:3306 --detach --name mysql --env MYSQL_RANDOM_ROOT_PASSWORD=yes mysql

#delete docker container (add -f to force for still running container )
dockoer container rm $first 3 container id

# -d = detach / -p = port / -env = to add variable
docker container run -d -name proxy -p 80:80 nginx

########################################################################################

# Docker Networks
# docker network ls                 = show networks
# docker network inspect            = inspect a network
# docker network create --driver    = create a network
# docker network connect            = attach a network to a container
# docker network disconnect         = detach a network from a container

docker network create my_app_net
# --network (to specify which private network the container will be attached to)
docker container run -d --name new_nginx --network my_app_net nginx

docker container run -d --name guacamole -p 8080:8080 -v /mnt:/config oznu/guacamole

### Kubernetes

sudo mount 10.82.11.19:/os /mnt/