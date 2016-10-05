WEB_DIR=web
APP_NAME=sarattall-web
IMAGE_TAG=sarattall/${APP_NAME}

.PHONY: default
default: help

.PHONY: help
help:
	@echo "BASIC USAGE"
	@echo "--------------------------------------------------"
	@echo "image	-	Create a Docker image with the app."
	@echo "run	- 	Run the Docker container from the image locally."
	@echo "kill	- 	Kill the running Docker container."
	@echo "clean	- 	Delete the Docker image, along with any other run artifacts."
	@echo
	@echo "DEPLOY"
	@echo "--------------------------------------------------"
	@echo "dev	-	Deploy the app to the dev environment (dev.sarattall.com)"
	@echo "prod	-	Deploy the app to the prod environment (www.sarattall.com)"

.PHONY: node_modules
node_modules:
	cd ${WEB_DIR} && npm install

.PHONY: image
image: node_modules
	-cd ${WEB_DIR} && docker rmi -f ${IMAGE_TAG}
	cd ${WEB_DIR} && docker build -t ${IMAGE_TAG} .

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

