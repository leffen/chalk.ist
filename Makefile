

DOCKER_IMAGE=leffen/chalkist
TAG=v.1.0.1

.PHONY: build

build:
	docker build -t ${DOCKER_IMAGE}:${TAG} .

run:
	docker run --rm -p 3031:8080 ${DOCKER_IMAGE}:${TAG}

push:
	docker push ${DOCKER_IMAGE}:${TAG}