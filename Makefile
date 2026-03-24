IMAGES = heartbleed-server heartbleed-hacker heartbleed-victim

build:
	docker build -t heartbleed-server ./heartbleed-server
	docker build -t heartbleed-hacker ./heartbleed-hacker
	docker build -t heartbleed-victim ./heartbleed-victim

rebuild:
	docker build --no-cache -t heartbleed-server ./heartbleed-server
	docker build --no-cache -t heartbleed-hacker ./heartbleed-hacker
	docker build --no-cache -t heartbleed-victim ./heartbleed-victim

run:
	docker run -d -p 80:80 -p 443:443 heartbleed-server
	docker run -d -p 6080:80 heartbleed-hacker
	docker run -d -p 6081:80 heartbleed-victim

stop:
	@for img in $(IMAGES); do \
		docker ps -q --filter ancestor=$$img | xargs -r docker stop; \
	done

clean: stop
	@for img in $(IMAGES); do \
		docker ps -aq --filter ancestor=$$img | xargs -r docker rm; \
		docker image rm -f $$img; \
	done

.PHONY: build rebuild run stop clean
