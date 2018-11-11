FROM postgres:11

COPY ./services/postgres/db.sql /docker-entrypoint-initdb.d/
#COPY ./services/postgres/init_docker_postgres.sh /docker-entrypoint-initdb.d/