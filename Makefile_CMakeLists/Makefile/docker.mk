FRONT := makefile-app
TAG := latest
IMAGE := $(FRONT):$(TAG)

build:
	docker build -t $(IMAGE) .

run: build
	docker run --rm $(IMAGE)