VERSION:=$$(yq r docker-compose.yaml services.a2sketch.build.args.version)

build:
	docker-compose build

test:
	./test.sh
	open out/index.html

start:	build
	docker-compose up

stop:
	docker-compose down

debug:
	@echo "default entrypoint: 'node a2sketch.webserver'"
	docker run -it -p 22753:22753 -v ${PWD}/custom-types:/custom-types:ro --entrypoint ash arne/a2sketch:$(VERSION)

push:
	docker-compose push

tag:
	git tag -a v$(VERSION) -m v$(VERSION)
	git push --tags

.PHONY: build test start stop debug push tag
