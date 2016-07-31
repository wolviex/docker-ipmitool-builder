#!/usr/bin/make -f

.PHONY: all build run

DOCKER_CMD ?= docker
IPMITOOL_BUILD_DIR ?= $(PWD)/build

all: build

build:
	$(DOCKER_CMD) build -t ipmitool:latest .

run:
	$(shell mkdir -p ./build)
	$(DOCKER_CMD) run \
		-it \
		--rm \
		-e GIT_CHECKOUT=true \
		-v $(IPMITOOL_BUILD_DIR):/build \
		ipmitool:latest /bin/bash build-ipmitool.sh
