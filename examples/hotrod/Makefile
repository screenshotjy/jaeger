VERSION := 0.0.4

IMAGE_TAG = $(shell echo $(VERSION) | sed 's|[+:]|-|g')

## service info
SERVICE_NAME := harnitsignalfxpoc
# Replace '+' with '-' in the semver because docker does support tags with '+'
# https://github.com/docker/distribution/issues/1201
IMAGE_NAME := registry.rcluster.io/oppmonpoc/$(SERVICE_NAME):$(IMAGE_TAG)

RC_HOSTNAME ?= localhost

local_build:
	bash -c "CGO_ENABLED=0 go build -ldflags '-X github.com/harnitsignalfx/jaeger/examples/hotrod/version.VERSION=$(VERSION)' -o bin/$(SERVICE_NAME)"

local_run: local_build
	JAEGER_ENDPOINT=http://10.92.49.140:9081/v1/trace \
	JAEGER_SERVICE_NAME=opmonpoc.harnitsignalfxpoc \
	JAEGER_USER=auth \
	JAEGER_PASSWORD=cLEDWI3cXhi43hLRCFMsiA \
	./bin/harnitsignalfxpoc all

build:
	bash -c "CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags '-X github.com/harnitsignalfx/jaeger/examples/hotrod/version.VERSION=$(VERSION)' -o bin/$(SERVICE_NAME)"
	docker build -t $(IMAGE_NAME) .

run:
	docker run \
	  --rm \
		-e HOST=ingest.signalfx.com \
		-e JAEGER_USER='auth' \
		-e JAEGER_PASSWORD='cLEDWI3cXhi43hLRCFMsiA' \
		-p 8080:8080 \
		-p 8081:8081 \
		-p 8082:8082 \
		-p 8083:8083 \
	  $(IMAGE_NAME)


.PHONY: build run
