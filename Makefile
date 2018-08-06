docker-build:
	docker build -f Dockerfile -t go-docker-skeleton .

docker-run:
	docker run --rm -t go-docker-skeleton

clean:
	docker rmi go-docker-skeleton

docker-clean: clean

.PHONY: docker-build docker-run clean docker-clean
