#!/usr/bin/make -f

.PHONY: all build run

DOCKER_CMD ?= docker
IPMITOOL_BUILD_DIR ?= $(PWD)/build
IPMITOOL_GIT_CHECKOUT ?= true

all: build

build:
	$(DOCKER_CMD) build -t ipmitool:latest .

run:
	$(shell mkdir -p ./build)
	$(DOCKER_CMD) run \
		-it \
		--rm \
		-e GIT_CHECKOUT=$(IPMITOOL_GIT_CHECKOUT) \
		-v $(IPMITOOL_BUILD_DIR):/build \
		ipmitool:latest /bin/bash build-ipmitool.sh
