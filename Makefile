docker-build:
	docker build -f Dockerfile -t go-docker-skeleton .

docker-run:
	docker run --rm -t go-docker-skeleton

.PHONY: docker-build
