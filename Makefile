IMAGE_TAG=sarattall/sarattall-web

.PHONY: default
default: container

.PHONY: container
container:
	-docker rmi ${IMAGE_TAG}
	docker build -t ${IMAGE_TAG} .

.PHONY: clean
clean:
	docker rmi ${IMAGE_TAG}

