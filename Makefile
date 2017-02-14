LOCAL_NAME=opencv
VERSION=2.4.13-cuda8.0-cudnn5
PUBLIC_NAME=docker-opencv
REPOSITORY=paga


.PHONY: all build tag release

all: build tag release

build:
	docker build -t $(LOCAL_NAME):$(VERSION) --rm .

tag: build
	docker tag $(LOCAL_NAME):$(VERSION) $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)

release: tag
	docker push $(REPOSITORY)/$(PUBLIC_NAME):$(VERSION)
