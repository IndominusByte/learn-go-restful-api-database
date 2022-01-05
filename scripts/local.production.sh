#!/bin/bash

export COMPOSE_IGNORE_ORPHANS=True

# postgresql
export POSTGRESQL_IMAGE=learn-go-restful-api-postgresql
export POSTGRESQL_IMAGE_TAG=production
export POSTGRESQL_CONTAINER=learn-go-restful-api-postgresql-production
export POSTGRESQL_HOST=learn-go-restful-api-postgresql.service
export POSTGRESQL_USER=toped
export POSTGRESQL_PASSWORD=123
export POSTGRESQL_DB=learn-go-restful-api
export POSTGRESQL_TIME_ZONE=Asia/Kuala_Lumpur
docker build -t "$POSTGRESQL_IMAGE:$POSTGRESQL_IMAGE_TAG" -f ./manifest-docker/Dockerfile.postgresql ./manifest-docker

# redis
export REDIS_IMAGE=learn-go-restful-api-redis
export REDIS_IMAGE_TAG=production
export REDIS_CONTAINER=learn-go-restful-api-redis-production
export REDIS_HOST=learn-go-restful-api-redis.service
docker build -t "$REDIS_IMAGE:$REDIS_IMAGE_TAG" -f ./manifest-docker/Dockerfile.redis ./manifest-docker

# pgadmin
export PGADMIN_IMAGE=learn-go-restful-api-pgadmin
export PGADMIN_IMAGE_TAG=production
export PGADMIN_CONTAINER=learn-go-restful-api-pgadmin-production
export PGADMIN_HOST=learn-go-restful-api-pgadmin.service
export PGADMIN_EMAIL=admin@test.com
export PGADMIN_PASSWORD=123
docker build -t "$PGADMIN_IMAGE:$PGADMIN_IMAGE_TAG" -f ./manifest-docker/Dockerfile.pgadmin ./manifest-docker

# pgbackups
export PGBACKUPS_IMAGE=learn-go-restful-api-pgbackups
export PGBACKUPS_IMAGE_TAG=production
export PGBACKUPS_CONTAINER=learn-go-restful-api-pgbackups-production
export PGBACKUPS_HOST=learn-go-restful-api-pgbackups.service
docker build -t "$PGBACKUPS_IMAGE:$PGBACKUPS_IMAGE_TAG" -f ./manifest-docker/Dockerfile.pgbackups ./manifest-docker

docker-compose -f ./manifest/docker-compose.production.yaml up -d --build
