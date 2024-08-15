build:
	docker build --rm -t rustapp .
	docker image prune -f
run:
	docker run rustapp:latest
