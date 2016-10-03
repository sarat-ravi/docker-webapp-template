IMAGE_TAG=sarattall/sarattall-web

.PHONY: default
default: app

.PHONY: node_modules
node_modules:
	npm install

.PHONY: image
image:
	-docker rmi ${IMAGE_TAG}
	docker build -t ${IMAGE_TAG} .

.PHONY: app
app: node_modules image

.PHONY: clean
clean:
	docker rmi ${IMAGE_TAG}

