all: docker-build-all

docker-build-all:
	@make -C ../video-processor-front docker-build
	@make -C ../video-processor-worker docker-build
	@make -C ../video-processor-uploader docker-build

