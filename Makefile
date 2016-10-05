WEB_DIR=web
APP_NAME=sarattall-web
IMAGE_TAG=sarattall/${APP_NAME}

.PHONY: default
default: app

.PHONY: node_modules
node_modules:
	cd ${WEB_DIR} && npm install

.PHONY: image
image:
	-cd ${WEB_DIR} && docker rmi -f ${IMAGE_TAG}
	cd ${WEB_DIR} && docker build -t ${IMAGE_TAG} .

.PHONY: app
app: node_modules image

.PHONY: run
run: app
	cd ${WEB_DIR} && docker run -p 8080:80 -d --name ${APP_NAME}  ${IMAGE_TAG}

.PHONY: dev 
dev:
	cd ${WEB_DIR} && eb deploy ${APP_NAME}-dev

.PHONY: prod
prod:
	cd ${WEB_DIR} && eb deploy ${APP_NAME}-prod

.PHONY: kill
kill:
	cd ${WEB_DIR} && docker stop ${APP_NAME}
	cd ${WEB_DIR} && docker rm ${APP_NAME}

.PHONY: clean
clean:
	cd ${WEB_DIR} && docker rmi ${IMAGE_TAG}

