.PHONY: build-img

build-img:
	docker run -e K3OS_VERSION=v0.11.1 -e TARGET=raspberrypi -e RASPBERRY_PI_FIRMWARE=latest -v ${PWD}:/app -v /dev:/dev --privileged picl-builder:latest
