.PHONY: ubuntu

IMAGENAME=concourse-git-resource-arm6
ubuntu: dockerfiles/ubuntu/Dockerfile
	docker build . -f $< -t ebilling/$(IMAGENAME):ubuntu

.PHONY: alpine

alpine: dockerfiles/alpine/Dockerfile
	docker build . -f $< -t ebilling/$(IMAGENAME):alpine

.PHONY: push

push: ubuntu alpine
	docker push ebilling/$(IMAGENAME):ubuntu
	docker push ebilling/$(IMAGENAME):alpine

