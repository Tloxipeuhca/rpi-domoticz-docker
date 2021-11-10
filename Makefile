.PHONY: all build push test version
include VERSION.env
include ARCHI.env

DOCKER_IMAGE_VERSION=$(VERSION)
DOCKER_IMAGE_ARCHI=$(ARCHI)
DOCKER_IMAGE_NAME=tloxipeuhca/rpi-domoticz-docker

all: build

build:
	docker build -t $(DOCKER_IMAGE_NAME):$(DOCKER_IMAGE_VERSION)$(DOCKER_IMAGE_ARCHI) --build-arg GF_VERSION=$(DOCKER_IMAGE_VERSION) -f Dockerfile$(DOCKER_IMAGE_ARCHI) .
	docker build -t $(DOCKER_IMAGE_NAME):latest --build-arg GF_VERSION=$(DOCKER_IMAGE_VERSION) -f Dockerfile$(DOCKER_IMAGE_ARCHI) .

test:
	docker run --rm $(DOCKER_IMAGE_NAME) /bin/echo "Success."

push:
	docker push $(DOCKER_IMAGE_NAME)
