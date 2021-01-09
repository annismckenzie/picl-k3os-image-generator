.PHONY: build-picl-builder-image build-img deploy-k3os-config update-k3osconfig-secret

build-picl-builder-image:
	docker build . -t picl-builder:latest

build-img:
	docker run -e K3OS_VERSION=v0.11.1 -e TARGET=raspberrypi -e RASPBERRY_PI_FIRMWARE=latest -v ${PWD}:/app -v /dev:/dev --privileged picl-builder:latest

deploy-k3os-config: update-k3osconfig-secret
	kustomize build k8s | kubectl apply -f -

update-k3osconfig-secret:
	docker run -v ${PWD}/config:/config ghcr.io/annismckenzie/k3os-config-operator/tools:v0.1.1-3-g387ede9
