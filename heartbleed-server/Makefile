IMAGE_NAME = heartbleed-server

build:
	docker build -t $(IMAGE_NAME) .

rebuild:
	docker build --no-cache -t $(IMAGE_NAME) .

run:
	docker run -d -p 80:80 -p 443:443 $(IMAGE_NAME)

stop:
	docker ps -q --filter ancestor=$(IMAGE_NAME) | xargs -r docker stop

clean: stop
	docker ps -aq --filter ancestor=$(IMAGE_NAME) | xargs -r docker rm
	docker image rm -f $(IMAGE_NAME)

.PHONY: build rebuild run stop clean
