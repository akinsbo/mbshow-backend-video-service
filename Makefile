NGINX_CONTAINER = nginx
FPM_CONTAINER = fpm

# Start up application
start:
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
	@echo"Re-create your container from the new image"
	docker-compose start $(FPM_CONTAINER)
	docker-compose start $(NGINX_CONTAINER)