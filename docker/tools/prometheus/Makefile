PROMETHEUS_IMAGE = my-prometheus
PROMETHEUS_CONTAINER = my-prometheus-container
FPM_CONTAINER = fpm

# Start prometheus container
start:
	@echo "building prometheus container"
	docker build -t $(PROMETHEUS_IMAGE) .
	@echo "starting the prometheus container"
	docker run -p 9090:9090 \
	--name $(PROMETHEUS_CONTAINER) $(PROMETHEUS_IMAGE)

# Stop and backup
stop:
	@echo "Stop the currently running container"
	docker stop $(PROMETHEUS_CONTAINER)