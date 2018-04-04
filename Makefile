NGINX_CONTAINER = nginx
FPM_CONTAINER = fpm

IMAGE_NAME = image-name
CONTAINER_NAME = container-name
TAG_NAME =v0.01
CONTAINER_PORT = 80
HOST_PORT = 3005

CONTAINER_VOLUME = /usr/share/nginx/html
HOST_VOLUME = `pwd`/docker/volumes/nginx-vol/_data
# Start up application
start:
	@echo "Please first start up docker"
	@echo "Firing up containers"
	docker-compose up

# Stop and backup
stop:
	@echo "Stop the currently running container"
	docker-compose stop $(NGINX_CONTAINER)
	docker-compose stop $(FPM_CONTAINER)
	#Next, take a snapshot of the persistent volume /path/to/php-fpm-persistence using:
	#
	#$ rsync -a /path/to/php-fpm-persistence /path/to/php-fpm-persistence.bkp.(date +%Y%m%d-%H.%M.%S)
	#You can use this snapshot to restore the database state should the upgrade fail.

# Remove current containers
remove:
	@echo "Removing the currently running containers
	docker-compose rm -v $(NGINX_CONTAINER)
	docker-compose rm -v $(FPM_CONTAINER)

# Re-run current containers
run:
	@echo "Re-create your container from the new image"
	docker-compose start $(FPM_CONTAINER)
	docker-compose start $(NGINX_CONTAINER)


# Run deployment container
deploy:
	@echo "Deploying"
	@echo "	building docker image"
#	docker-compose -f docker-compose.deploy.yml up
	# aws configure
#	docker build -t $(IMAGE_NAME):$(TAG_NAME) .
#	docker build \
#	--build-arg AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) \
#	--build-arg AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) \
#	-t $(IMAGE_NAME):$(TAG_NAME) .
	@echo ""
	docker stop $(CONTAINER_NAME)
	docker rm $(CONTAINER_NAME)
	docker run --env-file env.list -d \
	-p $(HOST_PORT):$(CONTAINER_PORT) \
	-v $(HOST_VOLUME):$(CONTAINER_VOLUME):ro \
	--name $(CONTAINER_NAME) $(IMAGE_NAME):$(TAG_NAME)

# git
fetch:
	@echo "Fetching from remote repository to override local content"
	git fetch --all
	@echo "resetting the local head to remote repository"
	git reset --hard origin/master

stash:
	@echo "stashing present content"
	git stash
	@echo "pulling from remote repository"
	git pull
	@echo "returning content"
	git stash pop


