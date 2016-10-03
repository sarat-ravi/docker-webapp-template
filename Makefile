APP_NAME=sarattall-web
IMAGE_TAG=sarattall/${APP_NAME}

.PHONY: default
default: app

.PHONY: node_modules
node_modules:
	npm install

.PHONY: image
image:
	-docker rmi -f ${IMAGE_TAG}
	docker build -t ${IMAGE_TAG} .

.PHONY: app
app: node_modules image

.PHONY: run
run:
	docker run -p 8080:80 -d --name ${APP_NAME}  ${IMAGE_TAG}

.PHONY: kill
kill:
	docker stop ${APP_NAME}
	docker rm ${APP_NAME}

.PHONY: clean
clean:
	docker rmi ${IMAGE_TAG}

