.PHONY: all build push test version
include VERSION.env

DOCKER_IMAGE_VERSION=$(VERSION)
DOCKER_IMAGE_NAME=tloxipeuhca/rpi-domoticz-docker

all: build

build:
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION) .

test:
	docker run --rm $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION) /bin/echo "Success."



