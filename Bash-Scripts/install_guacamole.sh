#!/bin/bash
#
# Guacamole involves 3 seperate containers:
# 1. guacamole/guacd (gucamole-server source)
# 2. guacamole/guacamole (Tomcat 8 with Websocker)
# 3. mysql OR postgresql
#
#

docker pull postgres

# Default port will be 4822

docker run --name some-guacd -d guacamole/guacd

# PostGres

docker run --name some-postgres -d postgres


# Initializing the PostgreSQL database
#
# 1. Create a database for Guacamole within PostgreSQL, such as guacamole_db
# 2. Run the script on the newly-created database.
# 3. Create a user for Guacamole within PostgreSQL with access to the tables and sequences of this database, such as guacamole_user.
#

 docker run --rm guacamole/guacamole /opt/guacamole/bin/initdb.sh --postgres > initdb.sql

 # Connecting Guacamole to PostgreSQL
 docker run --name some-guacamole  \
    --link some-guacd:guacd        \
    --link some-postgres:postgres  \
    ...
    -d -p 8080:8080 guacamole/guacamole



    2a1cc328db6d01b54b2016e05b39f5d80089deba9f8cd0e0d07564b4f057f86a

docker run --name example-mysql -e MYSQL_RANDOM_ROOT_PASSWORD=yes -e MYSQL_ONETIME_PASSWORD=yes -d mysql/mysql-server
docker logs example-mysql

ab!EwoKc4BoBL3wuwvYKLAHOd2e


new_root_password

##### working 
# https://github.com/oznu/docker-guacamole

docker container run -d --name guacamole -p 8080:8080 -v /mnt:/config oznu/guacamole