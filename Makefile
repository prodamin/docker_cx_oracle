all: help
IMAGE_NAME=cx_oracle

help:
	@echo "Usage:"
	@echo "build        - Build image: ${IMAGE_NAME}"

build:
	docker build --no-cache  -t ${IMAGE_NAME} .

