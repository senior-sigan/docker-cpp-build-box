TAG = sigan/build_box:latest

build:
	docker build --tag $(TAG) --rm .

push:
	docker push $(TAG)

default: build
